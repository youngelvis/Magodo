// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainUpdateResidentResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUpdateResidentResponseDataModel
    _$MainUpdateResidentResponseDataModelFromJson(Map<String, dynamic> json) =>
        MainUpdateResidentResponseDataModel(
          error: json['error'] as bool?,
          message: json['message'] as String?,
          code: json['code'] as int?,
          data: json['data'] == null
              ? null
              : UpdateResidentDataModel.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MainUpdateResidentResponseDataModelToJson(
        MainUpdateResidentResponseDataModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
