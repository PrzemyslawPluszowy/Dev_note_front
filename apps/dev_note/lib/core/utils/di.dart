import 'package:dev_note/core/data_source/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:p_repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

void setupDi() {
  getIt
    ..registerSingleton<TokenHiveRepo>(TokenHiveRepo())
    ..registerSingleton<DioClient>(DioClient(getIt<TokenHiveRepo>()))
    ..registerSingleton<AuthRepository>(AuthRepository(getIt<DioClient>().dio));
}
