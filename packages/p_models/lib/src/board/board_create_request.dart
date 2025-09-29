// {
//   "name": "string",
//   "description": "string",
//   "projectId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "workspaceId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_create_request.freezed.dart';
part 'board_create_request.g.dart';

@freezed
abstract class BoardCreateRequest with _$BoardCreateRequest {
  const factory BoardCreateRequest({
    required String name,
    String? description,
    required String projectId,
    required String workspaceId,
  }) = _BoardCreateRequest;
  factory BoardCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$BoardCreateRequestFromJson(json);

  const BoardCreateRequest._();
}
