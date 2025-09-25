// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateProjectRequest _$CreateProjectRequestFromJson(
  Map<String, dynamic> json,
) => _CreateProjectRequest(
  workspaceId: json['workspaceId'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  primaryColor: const ApiColorSchemeSerializer().fromJson(
    json['primaryColor'] as String?,
  ),
  icon: const PhosphorIconsSerializer().fromJson(json['icon'] as String?),
);

Map<String, dynamic> _$CreateProjectRequestToJson(
  _CreateProjectRequest instance,
) => <String, dynamic>{
  'workspaceId': instance.workspaceId,
  'name': instance.name,
  'description': instance.description,
  'primaryColor': _$JsonConverterToJson<String?, ApiColorScheme>(
    instance.primaryColor,
    const ApiColorSchemeSerializer().toJson,
  ),
  'icon': _$JsonConverterToJson<String?, ApiPhosphorIcons>(
    instance.icon,
    const PhosphorIconsSerializer().toJson,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
