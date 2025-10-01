import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/src/shared/enums/colors.dart';
import 'package:p_models/src/shared/enums/icons.dart';
import 'package:p_models/src/workspaces/enums/project_role.dart';
import 'package:p_models/src/workspaces/enums/workspace_role.dart';

part 'workspaces_model.freezed.dart';
part 'workspaces_model.g.dart';

@freezed
abstract class WorkspacesModel with _$WorkspacesModel {
  const factory WorkspacesModel({
    required String id,
    required String name,
    String? description,
    @PhosphorIconsSerializer() required ApiPhosphorIcons icon,
    @ApiColorSchemeSerializer() required ApiColorScheme primaryColor,
    required DateTime createdAt,
    @WorkspaceRoleSerializer() required WorkspaceRole workspaceRole,
    required List<ProjectModel> projects,
    //explity json
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isHide,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isExpanded,
  }) = _WorkspacesModel;

  factory WorkspacesModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspacesModelFromJson(json);
}

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String name,
    required String workspaceId,
    required DateTime createdAt,
    String? description,
    @PhosphorIconsSerializer() required ApiPhosphorIcons icon,
    @ApiColorSchemeSerializer() required ApiColorScheme primaryColor,
    @ProjectRoleSerializer() required ProjectRole projectRole,
    required List<BoardShortModel> boards,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isHide,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isExpanded,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

@freezed
abstract class BoardShortModel with _$BoardShortModel {
  const factory BoardShortModel({
    required String id,
    required String name,
    String? description,
    required String projectId,
    required DateTime createdAt,
    DateTime? updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isSelected,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool? isHide,
  }) = _BoardShortModel;

  factory BoardShortModel.fromJson(Map<String, dynamic> json) =>
      _$BoardShortModelFromJson(json);
}
