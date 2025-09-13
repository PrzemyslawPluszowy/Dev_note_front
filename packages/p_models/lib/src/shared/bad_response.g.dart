// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bad_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BadResponse _$BadResponseFromJson(Map<String, dynamic> json) => _BadResponse(
  statusCode: (json['statusCode'] as num).toInt(),
  errors: (json['errors'] as List<dynamic>)
      .map((e) => ErrorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BadResponseToJson(_BadResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
    };

_ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => _ErrorModel(
  field: json['field'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$ErrorModelToJson(_ErrorModel instance) =>
    <String, dynamic>{'field': instance.field, 'message': instance.message};
