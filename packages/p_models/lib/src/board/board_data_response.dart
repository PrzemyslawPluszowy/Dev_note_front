import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:p_models/models.dart';

part 'board_data_response.freezed.dart';
part 'board_data_response.g.dart';

@freezed
abstract class BoardDataResponse with _$BoardDataResponse {
  const factory BoardDataResponse({
    required BoardFullModel board,
    @Default([]) List<BoardCategoryModel> categories,
  }) = _BoardDataResponse;

  factory BoardDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardDataResponseFromJson(json);
}
