// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainRegistrationData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainRegistrationDataModel _$MainRegistrationDataModelFromJson(
        Map<String, dynamic> json) =>
    MainRegistrationDataModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : MainRegistrationDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainRegistrationDataModelToJson(
        MainRegistrationDataModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
