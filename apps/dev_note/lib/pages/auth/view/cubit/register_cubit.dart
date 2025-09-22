import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.authRepository,
  }) : super(RegisterInitial());

  final AuthRepository authRepository;

  Future<void> register(
    String email,
    String password,
    String username,
    File? avatar,
  ) async {
    emit(RegisterLoading());

    try {
      final request = RegisterRequest(
        email: email,
        password: password,
        username: username,
      );
      final response = await SafeApiCall.call(
        () => authRepository.register(
          email: request.email,
          password: request.password,
          confirmPassword: request.password,
          username: request.username,
          avatar: avatar,
        ),
      );
      emit(RegisterSuccess(message: response.message));
    } on ApiException catch (e) {
      emit(RegisterFailure(errorMessage: e));
    } catch (e, s) {
      emit(RegisterFailure(errorMessage: Exception('Unknown error: $e \n$s')));
    }
  }
}
