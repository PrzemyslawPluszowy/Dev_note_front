import 'package:dev_note/core/data_source/dio_client.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:p_repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

void setupDi() {
  getIt
    ..registerSingleton<TokenHiveRepo>(TokenHiveRepo())
    ..registerSingleton<AuthService>(
      AuthService(
        tokenHiveRepo: getIt<TokenHiveRepo>(),
      ),
    )
    ..registerLazySingleton<DioClient>(
      () => DioClient(
        tokenStorage: getIt<TokenHiveRepo>(),
        authService: getIt<AuthService>(),
      ),
    )
    ..registerSingleton<AuthRepository>(AuthRepository(getIt<DioClient>().dio))
    ..registerSingleton<UserRepository>(UserRepository(getIt<DioClient>().dio));
}
