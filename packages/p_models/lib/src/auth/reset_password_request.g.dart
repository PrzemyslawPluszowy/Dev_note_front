// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRequest(
  confirmPassword: json['confirmPassword'] as String,
  resetCode: (json['resetCode'] as num).toInt(),
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  ResetPasswordRequest instance,
) => <String, dynamic>{
  'resetCode': instance.resetCode,
  'newPassword': instance.newPassword,
  'confirmPassword': instance.confirmPassword,
};
