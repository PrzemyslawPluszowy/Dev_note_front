import 'package:bloc/bloc.dart';
import 'package:dev_note/core/data_source/dio_client.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/services/auth/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepository,
    required this.userRepository,
    required this.authService,
    required this.tokenHiveRepo,
  }) : super(LoginInitial());

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AuthService authService;
  final TokenHiveRepo tokenHiveRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    // TODO: add delay to show loading indicator
    await Future<void>.delayed(const Duration(milliseconds: 500));
    try {
      final request = LoginRequest(
        email: email,
        password: password,
      );
      final token = await SafeApiCall.call<LoginResponse>(
        () => authRepository.login(request),
      );
      await tokenHiveRepo.saveAccessToken(token);
      getIt<DioClient>().setToken(token.accessToken);
      final user = await SafeApiCall.call<AuthUserResponse>(
        userRepository.userMe,
      );

      authService.loginCorrect(user);

      emit(LoginSuccess());
    } on ApiException catch (e) {
      emit(LoginFailure(exception: e));
    } catch (e, s) {
      emit(LoginFailure(exception: Exception('Unknown error: $e \n$s')));
    }
  }
}
