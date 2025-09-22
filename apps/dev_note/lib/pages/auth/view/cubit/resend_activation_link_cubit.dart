import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'resend_activation_link_state.dart';

class ResendActivationLinkCubit extends Cubit<ResendActivationLinkState> {
  ResendActivationLinkCubit({
    required this.authRepository,
  }) : super(ResendActivationLinkInitial());

  final AuthRepository authRepository;

  Future<void> resendActivationLink(String email) async {
    emit(ResendActivationLinkLoading());

    try {
      final response = await SafeApiCall.call(
        () => authRepository.resendActivationLink(
          ResendActivationLink(email: email),
        ),
      );
      emit(ResendActivationLinkSuccess(message: response.message));
    } on ApiException catch (e, s) {
      Logger.error('ApiException: $e \n$s');
      emit(ResendActivationLinkFailure(error: e));
    } catch (e, s) {
      Logger.error('Unknown error: $e \n$s');
      emit(
        ResendActivationLinkFailure(error: Exception('Unknown error: $e \n$s')),
      );
    }
  }
}
