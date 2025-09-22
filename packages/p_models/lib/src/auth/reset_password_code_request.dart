import 'package:json_annotation/json_annotation.dart';

part 'reset_password_code_request.g.dart';

@JsonSerializable()
class ResetPasswordCodeRequest {
  final String email;

  ResetPasswordCodeRequest({required this.email});

  factory ResetPasswordCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordCodeRequestToJson(this);
}
