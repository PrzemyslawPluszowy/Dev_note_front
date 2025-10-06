// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkItemModel _$WorkItemModelFromJson(Map<String, dynamic> json) =>
    _WorkItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as String,
      boardId: json['boardId'] as String,
      parentWorkItemId: json['parentWorkItemId'] as String?,
      order: (json['order'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      assignedUserId: json['assignedUserId'] as String?,
      assignedUserName: json['assignedUserName'] as String?,
      ownerId: json['ownerId'] as String?,
      ownerName: json['ownerName'] as String?,
      observerIds: json['observerIds'] as String?,
      fieldValues:
          (json['fieldValues'] as List<dynamic>?)
              ?.map(
                (e) =>
                    WorkItemFieldValueModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      subWorkItems:
          (json['subWorkItems'] as List<dynamic>?)
              ?.map((e) => WorkItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkItemModelToJson(_WorkItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'boardId': instance.boardId,
      'parentWorkItemId': instance.parentWorkItemId,
      'order': instance.order,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'assignedUserId': instance.assignedUserId,
      'assignedUserName': instance.assignedUserName,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'observerIds': instance.observerIds,
      'fieldValues': instance.fieldValues,
      'subWorkItems': instance.subWorkItems,
    };

_WorkItemFieldValueModel _$WorkItemFieldValueModelFromJson(
  Map<String, dynamic> json,
) => _WorkItemFieldValueModel(
  id: json['id'] as String,
  value: json['value'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  workItemId: json['workItemId'] as String,
  fieldDefinitionId: json['fieldDefinitionId'] as String,
);

Map<String, dynamic> _$WorkItemFieldValueModelToJson(
  _WorkItemFieldValueModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'workItemId': instance.workItemId,
  'fieldDefinitionId': instance.fieldDefinitionId,
};
