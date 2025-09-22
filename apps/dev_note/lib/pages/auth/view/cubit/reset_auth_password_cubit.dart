import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'reset_auth_password_state.dart';

class ResetAuthPasswordCubit extends Cubit<ResetAuthPasswordState> {
  ResetAuthPasswordCubit({required this.authRepository}) : super(ResetAuthPasswordInitial());

  final AuthRepository authRepository;

  Future<void> sendResetPasswordCode({
    required String newPassword,
    required String confirmPassword,
    required int resetCode,
  }) async {
    emit(ResetAuthPasswordLoading());

    try {
      final request = ResetPasswordRequest(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        resetCode: resetCode,
      );
      final response = await SafeApiCall.call(
        () => authRepository.resetPassword(request),
      );
      emit(ResetAuthPasswordSuccess(response.message));
    } on ApiException catch (e, s) {
      Logger.error('ApiException: $e \n$s');
      emit(ResetAuthPasswordFailure(error: e));
    } catch (e, s) {
      Logger.error('Unknown error: $e \n$s');
      emit(
        ResetAuthPasswordFailure(error: Exception('Unknown error: $e \n$s')),
      );
    }
  }
}
