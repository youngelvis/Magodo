// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainPasscodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainPasscodeDataModel _$MainPasscodeDataModelFromJson(
        Map<String, dynamic> json) =>
    MainPasscodeDataModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : PasscodeDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainPasscodeDataModelToJson(
        MainPasscodeDataModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
