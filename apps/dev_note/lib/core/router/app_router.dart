import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/utils/di.dart'; // Import dla getIt
import 'package:dev_note/services/auth/auth_service.dart'; // Poprawiony import usługi autoryzacji
import 'package:flutter/material.dart';

/// Główny router aplikacji

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthService authService = getIt<AuthService>();

  /// Funkcja pomocnicza do tworzenia custom route z slide bottom transition
  static PageRouteBuilder<T> _createSlideBottomRoute<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      fullscreenDialog: page.fullscreenDialog,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      settings: page,
      pageBuilder: (_, _, _) => child,
    );
  }

  static PageRouteBuilder<T> _createFadeInRoute<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      fullscreenDialog: page.fullscreenDialog,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      settings: page,
      pageBuilder: (_, _, _) => child,
    );
  }

  @override
  late final List<AutoRouteGuard> guards = [
    AutoRouteGuard.simple((resolver, router) async {
      final isAuthenticated = authService.authState == AuthState.authorized;

      // Lista stron dostępnych dla gości (niezalogowanych)
      final guestRoutes = [
        Auth_wrapper.name,
        Login.name,
        Register.name,
        ForgotPassword.name,
        RequestResetCode.name,
        ResendActivationLinkRoute.name,
      ];

      final isGuestRoute = guestRoutes.contains(resolver.routeName);

      if (isAuthenticated) {
        if (isGuestRoute) {
          // Zalogowany użytkownik próbuje wejść na stronę auth -> przekieruj na główną
          await router.navigate(const Board());
          resolver.next(false);
        } else {
          // Zalogowany użytkownik na stronie dla zalogowanych -> pozwól
          resolver.next();
        }
      } else {
        if (isGuestRoute) {
          // Niezalogowany na stronie auth -> pozwól
          resolver.next();
        } else {
          // Niezalogowany próbuje wejść na chronioną stronę -> przekieruj na login
          await router.navigate(Login());
          resolver.next(false);
        }
      }
    }),
  ];

  @override
  List<AutoRoute> get routes => [
    // Auth wrapper dla stron autoryzacji
    AutoRoute(
      page: Auth_wrapper.page,
      path: '/auth',
      allowSnapshotting: false,
      children: [
        CustomRoute<Login>(
          page: Login.page,
          path: 'login',
          initial: true,
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createSlideBottomRoute,
        ),
        CustomRoute<Register>(
          page: Register.page,
          path: 'register',
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createSlideBottomRoute,
        ),
        CustomRoute<ForgotPassword>(
          page: ForgotPassword.page,
          path: 'forgotPassword',
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createSlideBottomRoute,
        ),
        CustomRoute<RequestResetCode>(
          page: RequestResetCode.page,
          path: 'requestResetCode',
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createSlideBottomRoute,
        ),
        CustomRoute<ResendActivationLinkRoute>(
          page: ResendActivationLinkRoute.page,
          path: 'resendActivationLink',
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createSlideBottomRoute,
        ),
      ],
    ),
    // Strony dla zalogowanych użytkowników na głównym poziomie
    CustomRoute<Board>(
      page: Board.page,
      path: '/',
      initial: true,
      maintainState: false,
      allowSnapshotting: false,
      customRouteBuilder: _createFadeInRoute,
    ),
    CustomRoute<Test>(
      page: Test.page,
      path: '/test',
      maintainState: false,
      allowSnapshotting: false,
      customRouteBuilder: _createFadeInRoute,
    ),
  ];
}

// Pobranie instancji AuthService
