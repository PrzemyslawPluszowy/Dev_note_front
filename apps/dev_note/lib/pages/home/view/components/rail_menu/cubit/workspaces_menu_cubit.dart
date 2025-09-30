import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'workspaces_menu_state.dart';

class WorkspacesMenuCubit extends Cubit<WorkspacesMenuState> {
  WorkspacesMenuCubit({
    required this.workspacesRepository,
  }) : super(const WorkspacesMenuLoading()) {
    unawaited(fetchWorkspaces(showLoading: true));
  }

  final WorkspacesRepository workspacesRepository;

  Future<void> fetchWorkspaces({required bool showLoading}) async {
    if (showLoading) {
      emit(
        WorkspacesMenuLoading(
          oldStateWorkspaces: state is WorkspacesMenuSuccess ? (state as WorkspacesMenuSuccess).workspaces : [],
        ),
      );
    }
    try {
      final workspaces = await SafeApiCall.call(
        workspacesRepository.getWorkspaces,
      );
      emit(WorkspacesMenuSuccess(workspaces: workspaces));
    } on ApiException catch (e, s) {
      Logger.error('WorkspacesMenuCubit', err: e, stackTrace: s);
      emit(WorkspacesMenuFailure(error: e));
    } catch (e, s) {
      Logger.error('WorkspacesMenuCubit', err: e, stackTrace: s);
      emit(WorkspacesMenuFailure(error: Exception(e.toString())));
    }
  }

  /// Reorder projects inside a workspace (in-memory only).
  /// This will emit a new [WorkspacesMenuSuccess] with updated order.
  void reorderProjects({
    required String workspaceId,
    required int oldIndex,
    required int newIndex,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;

    final projects = List.of(workspaces[workspaceIndex].projects);
    // adjust newIndex because ReorderableListView provides newIndex as if the
    // item was removed from the list first
    if (newIndex > oldIndex) newIndex -= 1;
    final item = projects.removeAt(oldIndex);
    projects.insert(newIndex, item);

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(projects: projects);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(WorkspacesMenuSuccess(workspaces: workspaces));
  }

  /// Reorder boards inside a project (in-memory only).
  void reorderBoards({
    required String workspaceId,
    required String projectId,
    required int oldIndex,
    required int newIndex,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;

    final projects = List.of(workspaces[workspaceIndex].projects);
    final projectIndex = projects.indexWhere((p) => p.id == projectId);
    if (projectIndex == -1) return;

    final boards = List.of(projects[projectIndex].boards);
    if (newIndex > oldIndex) newIndex -= 1;
    final item = boards.removeAt(oldIndex);
    boards.insert(newIndex, item);

    final updatedProject = projects[projectIndex].copyWith(boards: boards);
    projects[projectIndex] = updatedProject;

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(projects: projects);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(WorkspacesMenuSuccess(workspaces: workspaces));
  }

  /// Reorder workspaces (in-memory only).
  void reorderWorkspaces({
    required int oldIndex,
    required int newIndex,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    if (newIndex > oldIndex) newIndex -= 1;
    final item = workspaces.removeAt(oldIndex);
    workspaces.insert(newIndex, item);

    emit(WorkspacesMenuSuccess(workspaces: workspaces));
  }
}
