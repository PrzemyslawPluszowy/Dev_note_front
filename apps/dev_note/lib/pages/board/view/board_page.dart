import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'board')
class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board Page'),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () async {
                getIt<AuthService>().logout();
              },
              child: const Text('Log Out'),
            ),
            OutlinedButton(
              onPressed: () async {
                await context.router.push(const Test());
              },
              child: const Text('Test Page'),
            ),
          ],
        ),
      ),
    );
  }
}
