// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardCreateRequest _$BoardCreateRequestFromJson(Map<String, dynamic> json) =>
    _BoardCreateRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      projectId: json['projectId'] as String,
      workspaceId: json['workspaceId'] as String,
    );

Map<String, dynamic> _$BoardCreateRequestToJson(_BoardCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'projectId': instance.projectId,
      'workspaceId': instance.workspaceId,
    };
