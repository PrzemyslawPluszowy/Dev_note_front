// {
//   "destinationCategoryId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "newOrder": 0,
//   "newParentWorkItemId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "sourceCategoryId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "position": 0,
//   "relativeToWorkItemId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item_reorder.freezed.dart';
part 'work_item_reorder.g.dart';

enum MovePosition {
  @JsonValue(0)
  start,
  @JsonValue(1)
  end,
  @JsonValue(2)
  before,
  @JsonValue(3)
  after,
  @JsonValue(4)
  atIndex,
}

@freezed
abstract class WorkItemReorder with _$WorkItemReorder {
  const factory WorkItemReorder({
    required String destinationCategoryId,
    required int newOrder,
    required MovePosition position,
    String? newParentWorkItemId,
    String? sourceCategoryId,
    String? relativeToWorkItemId,
  }) = _WorkItemReorder;
  factory WorkItemReorder.fromJson(Map<String, dynamic> json) =>
      _$WorkItemReorderFromJson(json);
}
