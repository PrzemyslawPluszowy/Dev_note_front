// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardFullModel _$BoardFullModelFromJson(Map<String, dynamic> json) =>
    _BoardFullModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      projectId: json['projectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      fieldDefinitions:
          (json['fieldDefinitions'] as List<dynamic>?)
              ?.map((e) => FieldDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BoardFullModelToJson(_BoardFullModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'projectId': instance.projectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'fieldDefinitions': instance.fieldDefinitions,
    };

_FieldDefinition _$FieldDefinitionFromJson(Map<String, dynamic> json) =>
    _FieldDefinition(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      type: const FieldTypeConverter().fromJson((json['type'] as num).toInt()),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultValue: json['defaultValue'] as String?,
      isRequired: json['isRequired'] as bool,
      isVisible: json['isVisible'] as bool,
      order: (json['order'] as num).toInt(),
      width: (json['width'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      boardId: json['boardId'] as String,
      createdById: json['createdById'] as String?,
      createdByName: json['createdByName'] as String?,
      assignedToId: json['assignedToId'] as String?,
      assignedToName: json['assignedToName'] as String?,
      observedBy: (json['observedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FieldDefinitionToJson(_FieldDefinition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'type': const FieldTypeConverter().toJson(instance.type),
      'options': instance.options,
      'defaultValue': instance.defaultValue,
      'isRequired': instance.isRequired,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'width': instance.width,
      'createdAt': instance.createdAt.toIso8601String(),
      'boardId': instance.boardId,
      'createdById': instance.createdById,
      'createdByName': instance.createdByName,
      'assignedToId': instance.assignedToId,
      'assignedToName': instance.assignedToName,
      'observedBy': instance.observedBy,
    };
