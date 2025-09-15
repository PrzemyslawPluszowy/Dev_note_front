import 'package:dev_note/core/data_source/dio_client.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:flutter/foundation.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

/// Stan autoryzacji
/// - initial - początkowy stan
/// - authorized - autoryzacja przebiegła pomyślnie
/// - unauthorized - autoryzacja nie przebiegła pomyślnie
enum AuthState {
  authorized,
  unauthorized,
}

class AuthService extends ChangeNotifier {
  AuthService({
    required this.tokenHiveRepo,
  });

  final TokenHiveRepo tokenHiveRepo;

  // Lazy getters dla repositories
  AuthRepository get authRepository => getIt<AuthRepository>();
  UserRepository get userRepository => getIt<UserRepository>();

  AuthState _authState = AuthState.unauthorized;
  AuthUserResponse? user;

  AuthUserResponse get currentUser {
    if (user == null) {
      changeAuthState(AuthState.unauthorized);
    }
    return user!;
  }

  void loginCorrect(AuthUserResponse newUser) {
    user = newUser;
    _authState = AuthState.authorized;
    notifyListeners();
  }

  /// Wylogowanie użytkownika
  Future<void> logout() async {
    user = null;

    _authState = AuthState.unauthorized;
    await tokenHiveRepo.clearTokens();
    getIt<DioClient>().clearAuthToken();
    notifyListeners();
  }

  /// Sprawdza, czy użytkownik jest zalogowany
  bool isLoggedIn() {
    return _authState == AuthState.authorized && user != null;
  }

  /// Próba automatycznego zalogowania użytkownika na podstawie zapisanego tokena
  /// W przypadku niepowodzenia ustawia stan na unauthorized
  Future<void> autoLogin() async {
    try {
      final token = await tokenHiveRepo.getAccessToken();
      if (token == null) {
        Logger.error('Auto login failed: no token found');
        changeAuthState(AuthState.unauthorized);
        return;
      }

      final userResponse = await userRepository.userMe();
      user = userResponse;
      changeAuthState(AuthState.authorized);
    } catch (e, s) {
      Logger.error('Auto login failed', err: e, stackTrace: s);
      changeAuthState(AuthState.unauthorized);
      return;
    }
    notifyListeners();
  }

  void changeAuthState(AuthState newState) {
    _authState = newState;
    notifyListeners();
  }

  AuthState get authState => _authState;
}
