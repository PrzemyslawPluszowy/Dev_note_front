import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository, required this.userRepository})
    : super(LoginInitial());

  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final request = LoginRequest(
        email: email,
        password: password,
      );
      await SafeApiCall.call<LoginResponse>(
        () => authRepository.login(request),
      );
      await SafeApiCall.call<AuthUserResponse>(
        userRepository.userMe,
      );

      emit(LoginSuccess());
    } on ApiException catch (e) {
      emit(LoginFailure(exception: e));
    }
  }
}
