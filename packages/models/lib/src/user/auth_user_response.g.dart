// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    _AuthUserResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      avatar: json['avatar'] == null
          ? null
          : FileRecord.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthUserResponseToJson(_AuthUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'isActive': instance.isActive,
      'avatar': instance.avatar,
    };
