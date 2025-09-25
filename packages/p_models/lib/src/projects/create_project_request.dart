// {
//   "workspaceId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "name": "string",
//   "description": "string",
//   "icon": "string",
//   "primaryColor": "string"
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/src/shared/enums/colors.dart';
import 'package:p_models/src/shared/enums/icons.dart';

part 'create_project_request.freezed.dart';
part 'create_project_request.g.dart';

@freezed
abstract class CreateProjectRequest with _$CreateProjectRequest {
  const factory CreateProjectRequest({
    required String workspaceId,
    required String name,
    String? description,
    @ApiColorSchemeSerializer() ApiColorScheme? primaryColor,
    @PhosphorIconsSerializer() ApiPhosphorIcons? icon,
  }) = _CreateProjectRequest;

  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
}
