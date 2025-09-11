// {
//     "id": 0,
//     "fileName": "string",
//     "originalFileName": "string",
//     "contentType": "string",
//     "size": 0,
//     "createdAt": "2025-09-09T18:29:24.402Z",
//     "ownerId": 0,
//     "thumbnailUrl": "string"
//   }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_record.freezed.dart';
part 'file_record.g.dart';

@freezed
abstract class FileRecord with _$FileRecord {
  const factory FileRecord({
    required String id,
    required String fileName,
    required String originalFileName,
    required String contentType,
    required int size,
    required String createdAt,
    String? ownerId,
    String? thumbnailUrl,
  }) = _FileRecord;

  factory FileRecord.fromJson(Map<String, dynamic> json) =>
      _$FileRecordFromJson(json);
}
