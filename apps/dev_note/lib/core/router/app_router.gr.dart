// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:dev_note/pages/auth/view/auth_wraper.dart' as _i1;
import 'package:dev_note/pages/auth/view/forgot_password.dart' as _i3;
import 'package:dev_note/pages/auth/view/login_page.dart' as _i4;
import 'package:dev_note/pages/auth/view/register_page.dart' as _i8;
import 'package:dev_note/pages/auth/view/request_reset_code.dart' as _i9;
import 'package:dev_note/pages/auth/view/resend_activation_link.dart' as _i10;
import 'package:dev_note/pages/board/board_page.dart' as _i2;
import 'package:dev_note/pages/navigations/view/main_screen.dart' as _i6;
import 'package:dev_note/pages/navigations/view/navigation_widget.dart' as _i7;
import 'package:dev_note/pages/start_page/main_child_placeholder.dart' as _i5;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.AuthWrapper]
class Auth_wrapper extends _i11.PageRouteInfo<void> {
  const Auth_wrapper({List<_i11.PageRouteInfo>? children})
    : super(Auth_wrapper.name, initialChildren: children);

  static const String name = 'Auth_wrapper';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthWrapper();
    },
  );
}

/// generated route for
/// [_i2.BoardPage]
class BoardRoute extends _i11.PageRouteInfo<BoardRouteArgs> {
  BoardRoute({
    required String boardId,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         BoardRoute.name,
         args: BoardRouteArgs(boardId: boardId, key: key),
         rawPathParams: {'boardId': boardId},
         initialChildren: children,
       );

  static const String name = 'BoardRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BoardRouteArgs>(
        orElse: () => BoardRouteArgs(boardId: pathParams.getString('boardId')),
      );
      return _i2.BoardPage(boardId: args.boardId, key: args.key);
    },
  );
}

class BoardRouteArgs {
  const BoardRouteArgs({required this.boardId, this.key});

  final String boardId;

  final _i12.Key? key;

  @override
  String toString() {
    return 'BoardRouteArgs{boardId: $boardId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BoardRouteArgs) return false;
    return boardId == other.boardId && key == other.key;
  }

  @override
  int get hashCode => boardId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i3.ForgotPassword]
class ForgotPassword extends _i11.PageRouteInfo<void> {
  const ForgotPassword({List<_i11.PageRouteInfo>? children})
    : super(ForgotPassword.name, initialChildren: children);

  static const String name = 'ForgotPassword';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.ForgotPassword();
    },
  );
}

/// generated route for
/// [_i4.LoginPageContent]
class Login extends _i11.PageRouteInfo<LoginArgs> {
  Login({_i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        Login.name,
        args: LoginArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'Login';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i4.LoginPageContent(key: args.key);
    },
  );
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i5.MainChildPlaceholder]
class MainChildPlaceholder extends _i11.PageRouteInfo<void> {
  const MainChildPlaceholder({List<_i11.PageRouteInfo>? children})
    : super(MainChildPlaceholder.name, initialChildren: children);

  static const String name = 'MainChildPlaceholder';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainChildPlaceholder();
    },
  );
}

/// generated route for
/// [_i6.MainScreen]
class Main extends _i11.PageRouteInfo<MainArgs> {
  Main({_i12.Widget? child, _i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        Main.name,
        args: MainArgs(child: child, key: key),
        initialChildren: children,
      );

  static const String name = 'Main';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainArgs>(orElse: () => const MainArgs());
      return _i6.MainScreen(child: args.child, key: args.key);
    },
  );
}

class MainArgs {
  const MainArgs({this.child, this.key});

  final _i12.Widget? child;

  final _i12.Key? key;

  @override
  String toString() {
    return 'MainArgs{child: $child, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainArgs) return false;
    return child == other.child && key == other.key;
  }

  @override
  int get hashCode => child.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.NavigationWidget]
class Rail_navigation extends _i11.PageRouteInfo<void> {
  const Rail_navigation({List<_i11.PageRouteInfo>? children})
    : super(Rail_navigation.name, initialChildren: children);

  static const String name = 'Rail_navigation';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.NavigationWidget();
    },
  );
}

/// generated route for
/// [_i8.RegisterPage]
class Register extends _i11.PageRouteInfo<RegisterArgs> {
  Register({_i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        Register.name,
        args: RegisterArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'Register';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterArgs>(
        orElse: () => const RegisterArgs(),
      );
      return _i8.RegisterPage(key: args.key);
    },
  );
}

class RegisterArgs {
  const RegisterArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RegisterArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i9.RequestResetCode]
class RequestResetCode extends _i11.PageRouteInfo<RequestResetCodeArgs> {
  RequestResetCode({_i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        RequestResetCode.name,
        args: RequestResetCodeArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'RequestResetCode';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestResetCodeArgs>(
        orElse: () => const RequestResetCodeArgs(),
      );
      return _i9.RequestResetCode(key: args.key);
    },
  );
}

class RequestResetCodeArgs {
  const RequestResetCodeArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RequestResetCodeArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RequestResetCodeArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i10.ResendActivationLink]
class ResendActivationLinkRoute
    extends _i11.PageRouteInfo<ResendActivationLinkRouteArgs> {
  ResendActivationLinkRoute({_i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        ResendActivationLinkRoute.name,
        args: ResendActivationLinkRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ResendActivationLinkRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResendActivationLinkRouteArgs>(
        orElse: () => const ResendActivationLinkRouteArgs(),
      );
      return _i10.ResendActivationLink(key: args.key);
    },
  );
}

class ResendActivationLinkRouteArgs {
  const ResendActivationLinkRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ResendActivationLinkRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResendActivationLinkRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
