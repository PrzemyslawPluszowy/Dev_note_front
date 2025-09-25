// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workspace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateWorkspaceModel _$CreateWorkspaceModelFromJson(
  Map<String, dynamic> json,
) => _CreateWorkspaceModel(
  name: json['name'] as String,
  description: json['description'] as String?,
  icon: const PhosphorIconsSerializer().fromJson(json['icon'] as String?),
  primaryColor: const ApiColorSchemeSerializer().fromJson(
    json['primaryColor'] as String?,
  ),
);

Map<String, dynamic> _$CreateWorkspaceModelToJson(
  _CreateWorkspaceModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'icon': _$JsonConverterToJson<String?, ApiPhosphorIcons>(
    instance.icon,
    const PhosphorIconsSerializer().toJson,
  ),
  'primaryColor': _$JsonConverterToJson<String?, ApiColorScheme>(
    instance.primaryColor,
    const ApiColorSchemeSerializer().toJson,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
