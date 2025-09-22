import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'send_reset_code_state.dart';

class SendResetCodeCubit extends Cubit<SendResetCodeState> {
  SendResetCodeCubit({
    required this.authRepository,
  }) : super(SendResetCodeInitial());

  final AuthRepository authRepository;

  Future<void> sendResetCode(String email) async {
    emit(SendResetCodeLoading());
    try {
      final request = ResetPasswordCodeRequest(email: email);
      final response = await SafeApiCall.call(
        () => authRepository.requestResetPasswordCode(request),
      );
      emit(SendResetCodeSuccess(message: response.message));
    } on ApiException catch (e, s) {
      Logger.error('SendResetCodeCubit', err: e, stackTrace: s);
      emit(SendResetCodeFailure(error: e));
    } catch (e, s) {
      Logger.error('SendResetCodeCubit', err: e, stackTrace: s);
      emit(SendResetCodeFailure(error: Exception('Unknown error: $e \n$s')));
    }
  }
}
