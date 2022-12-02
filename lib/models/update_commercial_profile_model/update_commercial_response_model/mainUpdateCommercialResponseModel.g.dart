// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainUpdateCommercialResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUpdateCommercialResponseModel _$MainUpdateCommercialResponseModelFromJson(
        Map<String, dynamic> json) =>
    MainUpdateCommercialResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : UpdateCommercialResponseModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainUpdateCommercialResponseModelToJson(
        MainUpdateCommercialResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
