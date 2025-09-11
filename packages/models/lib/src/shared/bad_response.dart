import 'package:freezed_annotation/freezed_annotation.dart';

part 'bad_response.freezed.dart';
part 'bad_response.g.dart';

// {
//   "statusCode": 0,
//   "errors": [
//     {
//       "field": "string",
//       "message": "string"
//     }
//   ]
// }

@freezed
abstract class BadResponse with _$BadResponse {
  const factory BadResponse({
    required int statusCode,
    required List<ErrorModel> errors,
  }) = _BadResponse;

  factory BadResponse.fromJson(Map<String, dynamic> json) =>
      _$BadResponseFromJson(json);
}

@freezed
abstract class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    required String field,
    required String message,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
