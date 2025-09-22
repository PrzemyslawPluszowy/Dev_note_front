part of 'reset_auth_password_cubit.dart';

sealed class ResetAuthPasswordState extends Equatable {
  const ResetAuthPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetAuthPasswordInitial extends ResetAuthPasswordState {}

final class ResetAuthPasswordLoading extends ResetAuthPasswordState {}

final class ResetAuthPasswordSuccess extends ResetAuthPasswordState {
  const ResetAuthPasswordSuccess(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

final class ResetAuthPasswordFailure extends ResetAuthPasswordState {
  const ResetAuthPasswordFailure({required this.error});
  final Exception error;

  @override
  List<Object> get props => [error];
}
