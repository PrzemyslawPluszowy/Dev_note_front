import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_iteam_create.freezed.dart';
part 'work_iteam_create.g.dart';

@freezed
abstract class WorkItemCreate with _$WorkItemCreate {
  const factory WorkItemCreate({
    required String title,
    required String boardId,
    required String categoryId,
    String? parentWorkItemId,
  }) = _WorkItemCreate;

  factory WorkItemCreate.fromJson(Map<String, dynamic> json) =>
      _$WorkItemCreateFromJson(json);
}




// {
//   "title": "string",
//   "boardId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "categoryId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "parentWorkItemId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
// }