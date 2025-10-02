part of 'add_workspace_cubit.dart';

sealed class AddWorkspaceState extends Equatable {
  const AddWorkspaceState();

  @override
  List<Object> get props => [];
}

final class AddWorkspaceInitial extends AddWorkspaceState {
  const AddWorkspaceInitial();
}

final class AddWorkspaceLoading extends AddWorkspaceState {
  const AddWorkspaceLoading();
}

final class AddWorkspaceSuccess extends AddWorkspaceState {
  const AddWorkspaceSuccess();
}

final class AddWorkspaceFailure extends AddWorkspaceState {
  const AddWorkspaceFailure({required this.exception});
  final Exception exception;

  @override
  List<Object> get props => [exception];
}
