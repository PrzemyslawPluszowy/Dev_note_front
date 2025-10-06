// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_iteam_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkItemCreate _$WorkItemCreateFromJson(Map<String, dynamic> json) =>
    _WorkItemCreate(
      title: json['title'] as String,
      boardId: json['boardId'] as String,
      categoryId: json['categoryId'] as String,
      parentWorkItemId: json['parentWorkItemId'] as String?,
    );

Map<String, dynamic> _$WorkItemCreateToJson(_WorkItemCreate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'boardId': instance.boardId,
      'categoryId': instance.categoryId,
      'parentWorkItemId': instance.parentWorkItemId,
    };
