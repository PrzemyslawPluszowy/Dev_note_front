// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardCategoryModel _$BoardCategoryModelFromJson(Map<String, dynamic> json) =>
    _BoardCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: const ApiColorSchemeSerializer().fromJson(
        json['color'] as String?,
      ),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      order: (json['order'] as num).toInt(),
      isCollapsed: json['isCollapsed'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      boardId: json['boardId'] as String,
      workItems:
          (json['workItems'] as List<dynamic>?)
              ?.map((e) => WorkItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BoardCategoryModelToJson(_BoardCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': const ApiColorSchemeSerializer().toJson(instance.color),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'order': instance.order,
      'isCollapsed': instance.isCollapsed,
      'createdAt': instance.createdAt.toIso8601String(),
      'boardId': instance.boardId,
      'workItems': instance.workItems,
    };
