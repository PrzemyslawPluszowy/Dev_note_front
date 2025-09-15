// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dev_note/pages/auth/view/auth_wraper.dart' as _i1;
import 'package:dev_note/pages/auth/view/forgot_password.dart' as _i3;
import 'package:dev_note/pages/auth/view/login_page.dart' as _i4;
import 'package:dev_note/pages/auth/view/register_page.dart' as _i5;
import 'package:dev_note/pages/auth/view/request_reset_code.dart' as _i6;
import 'package:dev_note/pages/auth/view/resend_activation_link.dart' as _i7;
import 'package:dev_note/pages/board/view/board_page.dart' as _i2;
import 'package:dev_note/pages/board/view/test_page.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AuthWrapper]
class Auth_wrapper extends _i9.PageRouteInfo<void> {
  const Auth_wrapper({List<_i9.PageRouteInfo>? children})
    : super(Auth_wrapper.name, initialChildren: children);

  static const String name = 'Auth_wrapper';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthWrapper();
    },
  );
}

/// generated route for
/// [_i2.BoardPage]
class Board extends _i9.PageRouteInfo<void> {
  const Board({List<_i9.PageRouteInfo>? children})
    : super(Board.name, initialChildren: children);

  static const String name = 'Board';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.BoardPage();
    },
  );
}

/// generated route for
/// [_i3.ForgotPassword]
class ForgotPassword extends _i9.PageRouteInfo<ForgotPasswordArgs> {
  ForgotPassword({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        ForgotPassword.name,
        args: ForgotPasswordArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ForgotPassword';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordArgs>(
        orElse: () => const ForgotPasswordArgs(),
      );
      return _i3.ForgotPassword(key: args.key);
    },
  );
}

class ForgotPasswordArgs {
  const ForgotPasswordArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.LoginPageContent]
class Login extends _i9.PageRouteInfo<LoginArgs> {
  Login({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        Login.name,
        args: LoginArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'Login';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i4.LoginPageContent(key: args.key);
    },
  );
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i10.Key? key;

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
/// [_i5.RegisterPage]
class Register extends _i9.PageRouteInfo<RegisterArgs> {
  Register({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        Register.name,
        args: RegisterArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'Register';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterArgs>(
        orElse: () => const RegisterArgs(),
      );
      return _i5.RegisterPage(key: args.key);
    },
  );
}

class RegisterArgs {
  const RegisterArgs({this.key});

  final _i10.Key? key;

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
/// [_i6.RequestResetCode]
class RequestResetCode extends _i9.PageRouteInfo<RequestResetCodeArgs> {
  RequestResetCode({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        RequestResetCode.name,
        args: RequestResetCodeArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'RequestResetCode';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestResetCodeArgs>(
        orElse: () => const RequestResetCodeArgs(),
      );
      return _i6.RequestResetCode(key: args.key);
    },
  );
}

class RequestResetCodeArgs {
  const RequestResetCodeArgs({this.key});

  final _i10.Key? key;

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
/// [_i7.ResendActivationLink]
class ResendActivationLinkRoute
    extends _i9.PageRouteInfo<ResendActivationLinkRouteArgs> {
  ResendActivationLinkRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        ResendActivationLinkRoute.name,
        args: ResendActivationLinkRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ResendActivationLinkRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResendActivationLinkRouteArgs>(
        orElse: () => const ResendActivationLinkRouteArgs(),
      );
      return _i7.ResendActivationLink(key: args.key);
    },
  );
}

class ResendActivationLinkRouteArgs {
  const ResendActivationLinkRouteArgs({this.key});

  final _i10.Key? key;

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

/// generated route for
/// [_i8.TestPage]
class Test extends _i9.PageRouteInfo<void> {
  const Test({List<_i9.PageRouteInfo>? children})
    : super(Test.name, initialChildren: children);

  static const String name = 'Test';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.TestPage();
    },
  );
}
