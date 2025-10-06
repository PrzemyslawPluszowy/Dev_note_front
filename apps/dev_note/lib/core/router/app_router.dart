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
          await router.navigate(const Rail_navigation());
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
    CustomRoute<Rail_navigation>(
      page: Rail_navigation.page,
      path: '/',
      initial: true,
      maintainState: false,
      allowSnapshotting: false,
      customRouteBuilder: _createFadeInRoute,
      children: [
        CustomRoute<Main>(
          page: Main.page,
          path: 'main',
          initial: true,
          maintainState: false,
          allowSnapshotting: false,
          customRouteBuilder: _createFadeInRoute,
          children: [
            // Default empty child so Main always receives a non-null child when
            // it's created (prevents MainArgs null errors on initial navigation).
            AutoRoute(
              page: MainChildPlaceholder.page,
              initial: true,
            ),
            // child route to show a specific board by id: /main/board/:boardId
            CustomRoute<BoardRoute>(
              customRouteBuilder: _createFadeInRoute,
              path: 'board/:boardId',
              page: BoardRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}

// Pobranie instancji AuthService
