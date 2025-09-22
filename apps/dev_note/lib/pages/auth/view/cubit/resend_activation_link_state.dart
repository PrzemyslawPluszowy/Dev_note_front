part of 'resend_activation_link_cubit.dart';

sealed class ResendActivationLinkState extends Equatable {
  const ResendActivationLinkState();

  @override
  List<Object> get props => [];
}

final class ResendActivationLinkInitial extends ResendActivationLinkState {}

final class ResendActivationLinkLoading extends ResendActivationLinkState {}

final class ResendActivationLinkSuccess extends ResendActivationLinkState {
  const ResendActivationLinkSuccess({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class ResendActivationLinkFailure extends ResendActivationLinkState {
  const ResendActivationLinkFailure({required this.error});
  final Exception error;

  @override
  List<Object> get props => [error];
}
