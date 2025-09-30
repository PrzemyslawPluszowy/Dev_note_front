part of 'delete_workspace_cubit.dart';

sealed class DeleteWorkspaceState extends Equatable {
  const DeleteWorkspaceState();

  @override
  List<Object> get props => [];
}

final class DeleteWorkspaceInitial extends DeleteWorkspaceState {}

final class DeleteWorkspaceLoading extends DeleteWorkspaceState {}

final class DeleteWorkspaceSuccess extends DeleteWorkspaceState {}

final class DeleteWorkspaceFailure extends DeleteWorkspaceState {
  const DeleteWorkspaceFailure(this.error);

  final Exception error;

  @override
  List<Object> get props => [error];
}
