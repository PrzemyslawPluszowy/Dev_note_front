import 'package:dev_note/core/router/app_router.dart';
import 'package:dev_note/core/theme/app_theme.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/core/utils/hive_helper.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await HiveHelper.init();
  Logger.initialize(null);

  setupDi();
  await getIt<AuthService>().autoLogin();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('pl', 'PL'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pl', 'PL'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: _appRouter.config(
        reevaluateListenable: getIt<AuthService>(),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
