part of 'send_reset_code_cubit.dart';

sealed class SendResetCodeState extends Equatable {
  const SendResetCodeState();

  @override
  List<Object> get props => [];
}

final class SendResetCodeInitial extends SendResetCodeState {}

final class SendResetCodeLoading extends SendResetCodeState {}

final class SendResetCodeSuccess extends SendResetCodeState {
  const SendResetCodeSuccess({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class SendResetCodeFailure extends SendResetCodeState {
  const SendResetCodeFailure({required this.error});
  final Exception error;

  @override
  List<Object> get props => [error];
}
