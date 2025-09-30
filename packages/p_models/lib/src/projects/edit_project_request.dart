// {
//   "name": "string",
//   "description": "string",
//   "icon": "string",
//   "primaryColor": "string"
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/src/shared/enums/colors.dart';
import 'package:p_models/src/shared/enums/icons.dart';

part 'edit_project_request.freezed.dart';
part 'edit_project_request.g.dart';

@freezed
abstract class EditProjectRequest with _$EditProjectRequest {
  const factory EditProjectRequest({
    required String name,
    String? description,
    @ApiColorSchemeSerializer() ApiColorScheme? primaryColor,
    @PhosphorIconsSerializer() ApiPhosphorIcons? icon,
  }) = _EditProjectRequest;
  factory EditProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProjectRequestFromJson(json);
}
