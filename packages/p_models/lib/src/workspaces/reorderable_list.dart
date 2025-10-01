import 'package:freezed_annotation/freezed_annotation.dart';

part 'reorderable_list.freezed.dart';

/// Model do przechowywania informacji o kolejności workspace'ów, projektów i tablic
/// w UI. Będzie przechowywany lokalnie w Hive Ce i nie będzie synchronizowany z backendem.

@freezed
abstract class ReorderableList with _$ReorderableList {
  const factory ReorderableList({
    @Default([]) List<ReorderableWorkspace> workspaces,
  }) = _ReorderableList;
}

@freezed
abstract class ReorderableWorkspace with _$ReorderableWorkspace {
  const factory ReorderableWorkspace({
    required String workspaceId,
    @Default(false) bool isHide,
    @Default(false) bool isExpanded,
    @Default([]) List<ReorderableProject> projects,
  }) = _ReorderableWorkspace;
}

@freezed
abstract class ReorderableProject with _$ReorderableProject {
  const factory ReorderableProject({
    required String projectId,
    @Default(false) bool isHide,
    @Default(false) bool isExpanded,
    @Default([]) List<ReorderableBoard> boards,
  }) = _ReorderableProject;
}

@freezed
abstract class ReorderableBoard with _$ReorderableBoard {
  const factory ReorderableBoard({
    required String boardId,
    @Default(false) bool isHide,
  }) = _ReorderableBoard;
}
