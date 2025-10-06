// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardDataResponse _$BoardDataResponseFromJson(Map<String, dynamic> json) =>
    _BoardDataResponse(
      board: BoardFullModel.fromJson(json['board'] as Map<String, dynamic>),
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map(
                (e) => BoardCategoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BoardDataResponseToJson(_BoardDataResponse instance) =>
    <String, dynamic>{
      'board': instance.board,
      'categories': instance.categories,
    };
