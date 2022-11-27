// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrongDetailsResident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrongDetailsResident _$WrongDetailsResidentFromJson(
        Map<String, dynamic> json) =>
    WrongDetailsResident(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$WrongDetailsResidentToJson(
        WrongDetailsResident instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
    };
