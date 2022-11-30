// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgetPasswordResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
    };
