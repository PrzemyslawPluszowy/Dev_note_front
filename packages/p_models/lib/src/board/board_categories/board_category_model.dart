import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/models.dart';

part 'board_category_model.freezed.dart';
part 'board_category_model.g.dart';

@freezed
abstract class BoardCategoryModel with _$BoardCategoryModel {
  const factory BoardCategoryModel({
    required String id,
    required String name,
    @ApiColorSchemeSerializer() required ApiColorScheme color,
    DateTime? updatedAt,
    required int order,
    required bool isCollapsed,
    required DateTime createdAt,
    required String boardId,
    @Default([]) List<WorkItemModel> workItems,
  }) = _BoardCategoryModel;

  factory BoardCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BoardCategoryModelFromJson(json);
}
