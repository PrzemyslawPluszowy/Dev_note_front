import 'package:freezed_annotation/freezed_annotation.dart';

enum ProjectRole { owner, editor, viewer }

class ProjectRoleSerializer implements JsonConverter<ProjectRole, int> {
  const ProjectRoleSerializer();

  @override
  ProjectRole fromJson(int json) {
    switch (json) {
      case 0:
        return ProjectRole.owner;
      case 1:
        return ProjectRole.editor;
      case 2:
        return ProjectRole.viewer;
      default:
        throw ArgumentError('Invalid project role value: $json');
    }
  }

  @override
  int toJson(ProjectRole object) {
    switch (object) {
      case ProjectRole.owner:
        return 0;
      case ProjectRole.editor:
        return 1;
      case ProjectRole.viewer:
        return 2;
    }
  }
}
