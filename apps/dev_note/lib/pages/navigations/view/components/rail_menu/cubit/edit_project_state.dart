part of 'edit_project_cubit.dart';

sealed class EditProjectState extends Equatable {
  const EditProjectState();

  @override
  List<Object> get props => [];
}

final class EditProjectInitial extends EditProjectState {}

final class EditProjectLoading extends EditProjectState {}

final class EditProjectSuccess extends EditProjectState {}

final class EditProjectFailure extends EditProjectState {
  const EditProjectFailure(this.error);

  final Exception error;

  @override
  List<Object> get props => [error];
}
