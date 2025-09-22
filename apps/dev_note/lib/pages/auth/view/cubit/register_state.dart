part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class RegisterFailure extends RegisterState {
  const RegisterFailure({required this.errorMessage});
  final Exception errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
