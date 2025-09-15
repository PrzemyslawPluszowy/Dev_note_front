import 'dart:async';

import 'package:dev_note/core/env/env.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:p_repositories/repositories.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DioClient {
  DioClient({required this.tokenStorage, required this.authService});

  final TokenHiveRepo tokenStorage;
  final AuthService authService;

  /// Dio instance
  late final Dio dio = _createDio();

  Dio _createDio() {
    final dioInstance = Dio()..options.baseUrl = Env.apiUrl;

    dioInstance.interceptors
      ..add(AuthInterceptor(dioInstance, tokenStorage, authService))
      ..add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );

    return dioInstance;
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
    // Jeśli to nie 401 lub to już jest refresh request, przekaż błąd dalej
    if (err.response?.statusCode != 401 ||
        err.requestOptions.path.contains('auth/refresh')) {
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

    // Jeśli refresh się nie udał, przekaż oryginalny błąd
    unawaited(authService.logout());
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
