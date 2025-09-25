// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkspacesModel _$WorkspacesModelFromJson(Map<String, dynamic> json) =>
    _WorkspacesModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: const PhosphorIconsSerializer().fromJson(json['icon'] as String?),
      primaryColor: const ApiColorSchemeSerializer().fromJson(
        json['primaryColor'] as String?,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      workspaceRole: const WorkspaceRoleSerializer().fromJson(
        (json['workspaceRole'] as num).toInt(),
      ),
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkspacesModelToJson(_WorkspacesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': const PhosphorIconsSerializer().toJson(instance.icon),
      'primaryColor': const ApiColorSchemeSerializer().toJson(
        instance.primaryColor,
      ),
      'createdAt': instance.createdAt.toIso8601String(),
      'workspaceRole': const WorkspaceRoleSerializer().toJson(
        instance.workspaceRole,
      ),
      'projects': instance.projects,
    };

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      workspaceId: json['workspaceId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      icon: const PhosphorIconsSerializer().fromJson(json['icon'] as String?),
      primaryColor: const ApiColorSchemeSerializer().fromJson(
        json['primaryColor'] as String?,
      ),
      projectRole: const ProjectRoleSerializer().fromJson(
        (json['projectRole'] as num).toInt(),
      ),
      boards: (json['boards'] as List<dynamic>)
          .map((e) => BoardShortModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'workspaceId': instance.workspaceId,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'icon': const PhosphorIconsSerializer().toJson(instance.icon),
      'primaryColor': const ApiColorSchemeSerializer().toJson(
        instance.primaryColor,
      ),
      'projectRole': const ProjectRoleSerializer().toJson(instance.projectRole),
      'boards': instance.boards,
    };

_BoardShortModel _$BoardShortModelFromJson(Map<String, dynamic> json) =>
    _BoardShortModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      projectId: json['projectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BoardShortModelToJson(_BoardShortModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'projectId': instance.projectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
