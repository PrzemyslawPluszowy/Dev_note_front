import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/assets.gen.dart';
import 'package:dev_note/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'auth_wrapper')
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.light,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(Assets.images.loginBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: AutoRouter(),
          ),
        ),
      ),
    );
  }
}
