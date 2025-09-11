import 'package:rxdart/subjects.dart';

/// Stan autoryzacji
/// - initial - początkowy stan
/// - authorized - autoryzacja przebiegła pomyślnie
/// - unauthorized - autoryzacja nie przebiegła pomyślnie
enum AuthState {
  initial,
  authorized,
  unauthorized,
}

class AuthService {
  AuthService() : authStateSubject = BehaviorSubject.seeded(AuthState.initial);
  late final BehaviorSubject<AuthState> authStateSubject;

  /// Strumień stanów autoryzacji nasłuchujący na zmiany
  /// używany w routerze oraz routingach;
  Stream<AuthState> get authStateStream => authStateSubject.stream;

  /// change auth state
  void changeAuthState(AuthState authState) {
    authStateSubject.add(authState);
  }
}
