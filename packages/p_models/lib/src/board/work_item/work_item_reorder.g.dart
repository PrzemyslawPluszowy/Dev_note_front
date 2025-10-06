// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_reorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkItemReorder _$WorkItemReorderFromJson(Map<String, dynamic> json) =>
    _WorkItemReorder(
      destinationCategoryId: json['destinationCategoryId'] as String,
      newOrder: (json['newOrder'] as num).toInt(),
      position: $enumDecode(_$MovePositionEnumMap, json['position']),
      newParentWorkItemId: json['newParentWorkItemId'] as String?,
      sourceCategoryId: json['sourceCategoryId'] as String?,
      relativeToWorkItemId: json['relativeToWorkItemId'] as String?,
    );

Map<String, dynamic> _$WorkItemReorderToJson(_WorkItemReorder instance) =>
    <String, dynamic>{
      'destinationCategoryId': instance.destinationCategoryId,
      'newOrder': instance.newOrder,
      'position': _$MovePositionEnumMap[instance.position]!,
      'newParentWorkItemId': instance.newParentWorkItemId,
      'sourceCategoryId': instance.sourceCategoryId,
      'relativeToWorkItemId': instance.relativeToWorkItemId,
    };

const _$MovePositionEnumMap = {
  MovePosition.start: 0,
  MovePosition.end: 1,
  MovePosition.before: 2,
  MovePosition.after: 3,
  MovePosition.atIndex: 4,
};
