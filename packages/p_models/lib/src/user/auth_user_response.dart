// {
//   "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "email": "string",
//   "name": "string",
//   "isActive": true,
//   "avatar": {
//     "id": 0,
//     "fileName": "string",
//     "originalFileName": "string",
//     "contentType": "string",
//     "size": 0,
//     "createdAt": "2025-09-09T18:29:24.402Z",
//     "ownerId": 0,
//     "thumbnailUrl": "string"
//   }
// }

// AuthUserResponse{
// id*	string($uuid)
// email*	string
// name*	string
// isActive*	boolean
// avatar	FileRecord{
// id*	[...]
// fileName*	[...]
// originalFileName*	[...]
// contentType*	[...]
// size*	[...]
// createdAt*	[...]
// ownerId	[...]
// thumbnailUrl	[...]
// }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/src/shared/file_record.dart';

part 'auth_user_response.freezed.dart';
part 'auth_user_response.g.dart';

@freezed
abstract class AuthUserResponse with _$AuthUserResponse {
  const factory AuthUserResponse({
    required String id,
    required String email,
    required String name,
    required bool isActive,
    FileRecord? avatar,
  }) = _AuthUserResponse;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);
}
