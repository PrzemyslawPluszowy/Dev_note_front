part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  LoginFailure({required this.exception});
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
