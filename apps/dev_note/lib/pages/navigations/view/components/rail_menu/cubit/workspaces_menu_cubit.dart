import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'workspaces_menu_state.dart';

class WorkspacesMenuCubit extends Cubit<WorkspacesMenuState> {
  WorkspacesMenuCubit({
    required this.workspacesRepository,
    required this.reorderableHiveRepository,
    required this.menuHiddenMenuHiveRepository,
  }) : super(const WorkspacesMenuLoading()) {
    unawaited(fetchWorkspaces(showLoading: true));
  }

  final WorkspacesRepository workspacesRepository;
  final ReorderableHiveRepository reorderableHiveRepository;
  final MenuHiddenMenuHiveRepository menuHiddenMenuHiveRepository;

  Future<bool> _fetchHiddenMenuState() async {
    final isHidden = await menuHiddenMenuHiveRepository.get();
    return isHidden;
  }

  /// Pobiera workspace'y z API i ładuje zapisaną kolejność z Hive
  /// Jeżeli [showLoading] jest true, to emituje stan ładowania
  /// W przeciwnym razie emituje stan sukcesu z załadowanymi workspace'ami

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

      // Załaduj zapisaną kolejność z Hive i zastosuj ją
      final reorderedWorkspaces = await _applyReorderableData(workspaces);
      //Globalna flaga czy pokazywać ukryte elementy
      final isShowingHidden = await _fetchHiddenMenuState();

      emit(WorkspacesMenuSuccess(workspaces: reorderedWorkspaces, isShowingHidden: isShowingHidden));
    } on ApiException catch (e, s) {
      Logger.error('WorkspacesMenuCubit', err: e, stackTrace: s);
      emit(WorkspacesMenuFailure(error: e));
    } catch (e, s) {
      Logger.error('WorkspacesMenuCubit', err: e, stackTrace: s);
      emit(WorkspacesMenuFailure(error: Exception(e.toString())));
    }
  }

  ///Toggle zminiany stanu ukrywania/pokazywania ukrytych elementów
  ///Toggle zminiany stanu ukrywania/pokazywania ukrytych elementów
  Future<void> toggleHiddenMenu() async {
    if (state case WorkspacesMenuSuccess(:final isShowingHidden, :final workspaces)) {
      final newHiddenState = !isShowingHidden;
      unawaited(menuHiddenMenuHiveRepository.update(newHiddenState));
      emit(WorkspacesMenuSuccess(workspaces: workspaces, isShowingHidden: newHiddenState));
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

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nową kolejność do Hive
    unawaited(_saveReorderableData(workspaces));
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

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nową kolejność do Hive
    unawaited(_saveReorderableData(workspaces));
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

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nową kolejność do Hive
    unawaited(_saveReorderableData(workspaces));
  }

  /// Zastosuje zapisaną kolejność z Hive do pobranych danych z API
  Future<List<WorkspacesModel>> _applyReorderableData(List<WorkspacesModel> workspaces) async {
    final reorderableData = await reorderableHiveRepository.get();
    if (reorderableData == null) return workspaces;

    final reorderedWorkspaces = <WorkspacesModel>[];
    final workspaceMap = {for (final w in workspaces) w.id: w};

    // Najpierw dodaj workspace'y w zapisanej kolejności
    for (final reorderableWorkspace in reorderableData.workspaces) {
      final workspace = workspaceMap[reorderableWorkspace.workspaceId];
      if (workspace != null) {
        final reorderedProjects = _applyProjectsOrder(workspace.projects, reorderableWorkspace.projects);
        reorderedWorkspaces.add(
          workspace.copyWith(
            projects: reorderedProjects,
            isExpanded: reorderableWorkspace.isExpanded,
            isHide: reorderableWorkspace.isHide,
          ),
        );
        workspaceMap.remove(workspace.id);
      }
    }

    // Dodaj pozostałe workspace'y, które nie były w zapisanej kolejności
    reorderedWorkspaces.addAll(workspaceMap.values);

    return reorderedWorkspaces;
  }

  /// Zastosuje zapisaną kolejność projektów
  List<ProjectModel> _applyProjectsOrder(
    List<ProjectModel> projects,
    List<ReorderableProject> reorderableProjects,
  ) {
    final reorderedProjects = <ProjectModel>[];
    final projectMap = {for (final p in projects) p.id: p};

    // Najpierw dodaj projekty w zapisanej kolejności
    for (final reorderableProject in reorderableProjects) {
      final project = projectMap[reorderableProject.projectId];
      if (project != null) {
        final reorderedBoards = _applyBoardsOrder(project.boards, reorderableProject.boards);
        reorderedProjects.add(
          project.copyWith(
            boards: reorderedBoards,
            isExpanded: reorderableProject.isExpanded,
            isHide: reorderableProject.isHide,
          ),
        );
        projectMap.remove(project.id);
      }
    }

    // Dodaj pozostałe projekty
    reorderedProjects.addAll(projectMap.values);
    return reorderedProjects;
  }

  /// Zastosuje zapisaną kolejność tablic
  List<BoardShortModel> _applyBoardsOrder(
    List<BoardShortModel> boards,
    List<ReorderableBoard> reorderableBoards,
  ) {
    final reorderedBoards = <BoardShortModel>[];
    final boardMap = {for (final b in boards) b.id: b};

    // Najpierw dodaj tablice w zapisanej kolejności
    for (final reorderableBoard in reorderableBoards) {
      final board = boardMap[reorderableBoard.boardId];
      if (board != null) {
        reorderedBoards.add(board);
        boardMap.remove(board.id);
      }
    }

    // Dodaj pozostałe tablice
    reorderedBoards.addAll(boardMap.values);
    return reorderedBoards;
  }

  /// Zapisze aktualną kolejność do Hive
  Future<void> _saveReorderableData(List<WorkspacesModel> workspaces) async {
    final reorderableList = ReorderableList(
      workspaces: workspaces
          .map(
            (workspace) => ReorderableWorkspace(
              workspaceId: workspace.id,
              isHide: workspace.isHide ?? false,
              isExpanded: workspace.isExpanded ?? false,
              projects: workspace.projects
                  .map(
                    (project) => ReorderableProject(
                      projectId: project.id,
                      isHide: project.isHide ?? false,
                      isExpanded: project.isExpanded ?? false,
                      boards: project.boards
                          .map(
                            (board) => ReorderableBoard(
                              boardId: board.id,
                              isHide: board.isHide ?? false,
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );

    await reorderableHiveRepository.update(reorderableList);
  }

  /// Toguje stan rozwinięcia workspace'a
  void toggleWorkspaceExpansion({
    required String workspaceId,
    required bool isExpanded,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(isExpanded: isExpanded);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nowy stan do Hive
    unawaited(_saveReorderableData(workspaces));
  }

  /// Toguje stan rozwinięcia projektu
  void toggleProjectExpansion({
    required String workspaceId,
    required String projectId,
    required bool isExpanded,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;

    final projects = List.of(workspaces[workspaceIndex].projects);
    final projectIndex = projects.indexWhere((p) => p.id == projectId);
    if (projectIndex == -1) return;

    final updatedProject = projects[projectIndex].copyWith(isExpanded: isExpanded);
    projects[projectIndex] = updatedProject;

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(projects: projects);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nowy stan do Hive
    unawaited(_saveReorderableData(workspaces));
  }

  /// Ukrywa/Pokazuje workspace
  void toggleWorkspaceVisibility({
    required String workspaceId,
    required bool isHide,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;

    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(isHide: isHide);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(state.copyWith(workspaces: workspaces));

    // Zapisz nowy stan do Hive
    unawaited(_saveReorderableData(workspaces));
  }

  /// Ukrywa/Pokazuje projekt
  void toggleProjectVisibility({
    required String workspaceId,
    required String projectId,
    required bool isHide,
  }) {
    final state = this.state;
    if (state is! WorkspacesMenuSuccess) return;
    final workspaces = List.of(state.workspaces);
    final workspaceIndex = workspaces.indexWhere((w) => w.id == workspaceId);
    if (workspaceIndex == -1) return;
    final projects = List.of(workspaces[workspaceIndex].projects);
    final projectIndex = projects.indexWhere((p) => p.id == projectId);
    if (projectIndex == -1) return;
    final updatedProject = projects[projectIndex].copyWith(isHide: isHide);
    projects[projectIndex] = updatedProject;
    final updatedWorkspace = workspaces[workspaceIndex].copyWith(projects: projects);
    workspaces[workspaceIndex] = updatedWorkspace;
    emit(state.copyWith(workspaces: workspaces));
    // Zapisz nowy stan do Hive
    unawaited(_saveReorderableData(workspaces));
  }

  /// Ukrywa/Pokazuje tablicę
  void toggleBoardVisibility({
    required String workspaceId,
    required String projectId,
    required String boardId,
    required bool isHide,
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
    final boardIndex = boards.indexWhere((b) => b.id == boardId);
    if (boardIndex == -1) return;

    final updatedBoard = boards[boardIndex].copyWith(isHide: isHide);
    boards[boardIndex] = updatedBoard;

    final updatedProject = projects[projectIndex].copyWith(boards: boards);
    projects[projectIndex] = updatedProject;

    final updatedWorkspace = workspaces[workspaceIndex].copyWith(projects: projects);
    workspaces[workspaceIndex] = updatedWorkspace;

    emit(state.copyWith(workspaces: workspaces));
  }
}
