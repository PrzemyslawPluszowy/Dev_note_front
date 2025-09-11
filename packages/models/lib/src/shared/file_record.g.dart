// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileRecord _$FileRecordFromJson(Map<String, dynamic> json) => _FileRecord(
  id: json['id'] as String,
  fileName: json['fileName'] as String,
  originalFileName: json['originalFileName'] as String,
  contentType: json['contentType'] as String,
  size: (json['size'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  ownerId: json['ownerId'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$FileRecordToJson(_FileRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'originalFileName': instance.originalFileName,
      'contentType': instance.contentType,
      'size': instance.size,
      'createdAt': instance.createdAt,
      'ownerId': instance.ownerId,
      'thumbnailUrl': instance.thumbnailUrl,
    };
