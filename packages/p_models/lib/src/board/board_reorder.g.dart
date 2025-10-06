// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_reorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardCategoryReorderRequest _$BoardCategoryReorderRequestFromJson(
  Map<String, dynamic> json,
) => _BoardCategoryReorderRequest(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryReorderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BoardCategoryReorderRequestToJson(
  _BoardCategoryReorderRequest instance,
) => <String, dynamic>{'categories': instance.categories};

_CategoryReorderItem _$CategoryReorderItemFromJson(Map<String, dynamic> json) =>
    _CategoryReorderItem(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryReorderItemToJson(
  _CategoryReorderItem instance,
) => <String, dynamic>{'id': instance.id, 'order': instance.order};
