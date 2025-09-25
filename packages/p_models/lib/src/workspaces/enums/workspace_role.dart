import 'package:freezed_annotation/freezed_annotation.dart';

enum WorkspaceRole { admin, user }

class WorkspaceRoleSerializer implements JsonConverter<WorkspaceRole, int> {
  const WorkspaceRoleSerializer();

  @override
  WorkspaceRole fromJson(int json) {
    switch (json) {
      case 0:
        return WorkspaceRole.admin;
      case 1:
        return WorkspaceRole.user;
      default:
        throw ArgumentError('Invalid workspace role value: $json');
    }
  }

  @override
  int toJson(WorkspaceRole object) {
    switch (object) {
      case WorkspaceRole.admin:
        return 0;
      case WorkspaceRole.user:
        return 1;
    }
  }
}
