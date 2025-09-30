// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditProjectRequest _$EditProjectRequestFromJson(Map<String, dynamic> json) =>
    _EditProjectRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      primaryColor: const ApiColorSchemeSerializer().fromJson(
        json['primaryColor'] as String?,
      ),
      icon: const PhosphorIconsSerializer().fromJson(json['icon'] as String?),
    );

Map<String, dynamic> _$EditProjectRequestToJson(_EditProjectRequest instance) =>
    <String, dynamic>{
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
