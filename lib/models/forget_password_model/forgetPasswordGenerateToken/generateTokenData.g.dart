// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generateTokenData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTokenDataModel _$GenerateTokenDataModelFromJson(
        Map<String, dynamic> json) =>
    GenerateTokenDataModel(
      resident_phone: json['resident_phone'] as String?,
      email: json['email'] as String?,
      resident_reg_code: json['resident_reg_code'] as String?,
    );

Map<String, dynamic> _$GenerateTokenDataModelToJson(
        GenerateTokenDataModel instance) =>
    <String, dynamic>{
      'resident_reg_code': instance.resident_reg_code,
      'email': instance.email,
      'resident_phone': instance.resident_phone,
    };
