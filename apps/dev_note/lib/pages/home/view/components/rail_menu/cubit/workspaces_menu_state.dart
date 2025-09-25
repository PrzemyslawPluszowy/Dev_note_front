part of 'workspaces_menu_cubit.dart';

sealed class WorkspacesMenuState extends Equatable {
  const WorkspacesMenuState();

  @override
  List<Object> get props => [];
}

final class WorkspacesMenuLoading extends WorkspacesMenuState {
  const WorkspacesMenuLoading({this.oldStateWorkspaces = const []});
  final List<WorkspacesModel> oldStateWorkspaces;

  @override
  List<Object> get props => [oldStateWorkspaces];
}

final class WorkspacesMenuSuccess extends WorkspacesMenuState {
  const WorkspacesMenuSuccess({
    required this.workspaces,
  });

  final List<WorkspacesModel> workspaces;

  @override
  List<Object> get props => [workspaces];
}

final class WorkspacesMenuFailure extends WorkspacesMenuState {
  const WorkspacesMenuFailure({
    required this.error,
  });

  final Exception error;

  @override
  List<Object> get props => [error];
}
