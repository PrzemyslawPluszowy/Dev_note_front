// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:p_models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repository.g.dart';

/// Operacje na użytkowniku
@RestApi()
/// Operacje na użytkowniku
abstract class UserRepository {
  factory UserRepository(Dio dio) = _UserRepository;

  /// Pobranie informacji o użytkowniku po poprawnym autoryzacji
  @GET('/users/me')
  Future<AuthUserResponse> userMe();
}
