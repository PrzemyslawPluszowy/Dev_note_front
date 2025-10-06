import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_reorder.freezed.dart';
part 'board_reorder.g.dart';

@freezed
abstract class BoardCategoryReorderRequest with _$BoardCategoryReorderRequest {
  const factory BoardCategoryReorderRequest({
    required List<CategoryReorderItem> categories,
  }) = _BoardCategoryReorderRequest;

  factory BoardCategoryReorderRequest.fromJson(Map<String, dynamic> json) =>
      _$BoardCategoryReorderRequestFromJson(json);
}

@freezed
abstract class CategoryReorderItem with _$CategoryReorderItem {
  const factory CategoryReorderItem({required String id, required int order}) =
      _CategoryReorderItem;

  factory CategoryReorderItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryReorderItemFromJson(json);
}
