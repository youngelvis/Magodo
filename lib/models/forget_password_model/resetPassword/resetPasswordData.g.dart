// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetPasswordData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    ResetPasswordModel(
      confirm_password: json['confirm_password'] as String?,
      new_password: json['new_password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(ResetPasswordModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'new_password': instance.new_password,
      'confirm_password': instance.confirm_password,
    };
