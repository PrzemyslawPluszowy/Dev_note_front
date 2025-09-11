import 'package:dio/dio.dart';
import 'package:p_models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio) = _AuthRepository;

  /// Logowanie
  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  /// Odświeżanie tokenu
  @POST('/auth/refresh')
  Future<RefreshResponse> refresh(@Body() RefreshRequest request);
}
