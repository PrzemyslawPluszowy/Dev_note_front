part of 'edit_workspace_cubit.dart';

sealed class EditWorkspaceState extends Equatable {
  const EditWorkspaceState();

  @override
  List<Object> get props => [];
}

final class EditWorkspaceInitial extends EditWorkspaceState {}

final class EditWorkspaceLoading extends EditWorkspaceState {}

final class EditWorkspaceSuccess extends EditWorkspaceState {}

final class EditWorkspaceFailure extends EditWorkspaceState {
  const EditWorkspaceFailure(this.error);

  final Exception error;

  @override
  List<Object> get props => [error];
}
