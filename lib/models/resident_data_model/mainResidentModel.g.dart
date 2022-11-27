// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainResidentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResidentModel _$MainResidentModelFromJson(Map<String, dynamic> json) =>
    MainResidentModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : ResidentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainResidentModelToJson(MainResidentModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
