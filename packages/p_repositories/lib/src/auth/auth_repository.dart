import 'dart:io';

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

  /// Rejestracja
  @POST('/auth/register')
  @MultiPart()
  Future<MessageResponse> register({
    @Part(name: 'email') required String email,
    @Part(name: 'password') required String password,
    @Part(name: 'confirmPassword') required String confirmPassword,
    @Part(name: 'name') required String username,
    @Part(name: 'avatar') File? avatar,
  });

  /// Wysyłanie linku aktywacyjnego
  @POST('/auth/resendActivationLink')
  Future<MessageResponse> resendActivationLink(
    @Body() ResendActivationLink request,
  );

  /// Resetowanie hasła - wysyłanie maila
  @POST('/auth/requestResetPasswordCode')
  Future<MessageResponse> requestResetPasswordCode(
    @Body() ResetPasswordCodeRequest request,
  );

  /// Resetowanie hasła - ustawianie nowego hasła
  @POST('/auth/resetPassword')
  Future<MessageResponse> resetPassword(@Body() ResetPasswordRequest request);
}
