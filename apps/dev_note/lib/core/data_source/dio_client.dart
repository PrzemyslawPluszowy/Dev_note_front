import 'dart:async';

import 'package:dev_note/core/env/env.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DioClient {
  DioClient({required this.tokenStorage, required this.authService});

  final TokenHiveRepo tokenStorage;
  final AuthService authService;

  /// Dio instance
  late final Dio dio = _createDio();

  /// Auth interceptor instance (null gdy nie jest dodany)
  AuthInterceptor? _authInterceptor;

  Dio _createDio() {
    final dioInstance = Dio()
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.sendTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json
      ..options.baseUrl = Env.apiUrl;

    // Dodaj tylko logger interceptor na początku
    dioInstance.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );

    return dioInstance;
  }

  /// Dodaj auth interceptor po zalogowaniu
  void addAuthInterceptor() {
    if (_authInterceptor == null) {
      _authInterceptor = AuthInterceptor(dio, tokenStorage, authService);
      dio.interceptors.insert(0, _authInterceptor!); // Dodaj na początku
      Logger.debug('AuthInterceptor added');
    }
  }

  /// Usuń auth interceptor po wylogowaniu
  void removeAuthInterceptor() {
    if (_authInterceptor != null) {
      dio.interceptors.remove(_authInterceptor);
      _authInterceptor = null;
      clearAuthToken();
      Logger.debug('AuthInterceptor removed');
    }
  }

  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    dio.options.headers.remove('Authorization');
  }
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.dio, this.tokenStorage, this.authService);

  final Dio dio;
  final TokenHiveRepo tokenStorage;
  final AuthService authService;
  Future<String?>? _refreshFuture;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Interceptor jest dodawany tylko po zalogowaniu, więc zawsze dodajemy token
    final token = await tokenStorage.getAccessToken();
    if (token?.accessToken.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${token!.accessToken}';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    Logger.error('DioError: ${err.type} - ${err.message}');
    Logger.error(
      'Request: ${err.requestOptions.method} ${err.requestOptions.uri}',
    );

    // Jeśli to nie 401 lub to już jest refresh request, przekaż błąd dalej
    if (err.response?.statusCode != 401 || err.requestOptions.path.contains('auth/refresh')) {
      return handler.next(err);
    }

    // Spróbuj odświeżyć token (tylko raz na raz)
    _refreshFuture ??= _refreshToken();
    final newToken = await _refreshFuture;

    if (newToken != null) {
      // Ponów żądanie z nowym tokenem
      final request = err.requestOptions.copyWith(
        headers: {
          ...err.requestOptions.headers,
          'Authorization': 'Bearer $newToken',
        },
      );

      try {
        final response = await dio.fetch<dynamic>(request);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(e as DioException);
      }
    }

    // Jeśli refresh się nie udał, usuń auth interceptor i wyloguj
    unawaited(authService.logout());
    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    try {
      final tokens = await tokenStorage.getAccessToken();
      if (tokens?.refreshToken == null) return null;

      dio.options.headers['Authorization'] = '';
      final response = await dio.post<RefreshResponse>(
        'auth/refresh',
        data: RefreshRequest(refreshToken: tokens!.refreshToken),
      );

      final newToken = response.data?.token;
      if (newToken != null) {
        await tokenStorage.saveAccessToken(
          LoginResponse(
            accessToken: newToken,
            refreshToken: tokens.refreshToken,
          ),
        );
        return newToken;
      }
    } catch (e) {
      // Jeśli refresh token jest nieprawidłowy (498), wyczyść tokeny
      if (e is DioException && e.response?.statusCode == 498) {
        await tokenStorage.clearTokens();
        // Tutaj możesz dodać nawigację do ekranu logowania
      }
    } finally {
      _refreshFuture = null;
    }
    return null;
  }
}
