import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item_model.freezed.dart';
part 'work_item_model.g.dart';

@freezed
abstract class WorkItemModel with _$WorkItemModel {
  const factory WorkItemModel({
    required String id,
    required String title,
    String? description,
    required String categoryId,
    required String boardId,
    String? parentWorkItemId,
    required int order,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? dueDate,
    String? assignedUserId,
    String? assignedUserName,
    String? ownerId,
    String? ownerName,
    String? observerIds,
    @Default([]) List<WorkItemFieldValueModel> fieldValues,
    @Default([]) List<WorkItemModel> subWorkItems,
  }) = _WorkItemModel;

  factory WorkItemModel.fromJson(Map<String, dynamic> json) =>
      _$WorkItemModelFromJson(json);
}

@freezed
abstract class WorkItemFieldValueModel with _$WorkItemFieldValueModel {
  const factory WorkItemFieldValueModel({
    required String id,
    String? value,
    required DateTime updatedAt,
    required String workItemId,
    required String fieldDefinitionId,
  }) = _WorkItemFieldValueModel;

  factory WorkItemFieldValueModel.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFieldValueModelFromJson(json);
}
