import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';

/// Główny router aplikacji

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
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

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: Auth_wrapper.page,
      path: '/',
      initial: true,
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
  ];
}
