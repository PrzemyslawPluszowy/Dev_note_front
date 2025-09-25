// {
//   "name": "string",
//   "description": "string",
//   "icon": "string",
//   "primaryColor": "string"
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/src/shared/enums/colors.dart';
import 'package:p_models/src/shared/enums/icons.dart';

part 'create_workspace_model.freezed.dart';
part 'create_workspace_model.g.dart';

@freezed
abstract class CreateWorkspaceModel with _$CreateWorkspaceModel {
  const factory CreateWorkspaceModel({
    required String name,
    String? description,
    @PhosphorIconsSerializer() ApiPhosphorIcons? icon,
    @ApiColorSchemeSerializer() ApiColorScheme? primaryColor,
  }) = _CreateWorkspaceModel;
  factory CreateWorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkspaceModelFromJson(json);
}
