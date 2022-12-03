// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addFamilyMemberData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFamilyMemberDataModel _$AddFamilyMemberDataModelFromJson(
        Map<String, dynamic> json) =>
    AddFamilyMemberDataModel(
      resident_phone: json['resident_phone'] as String?,
      full_name: json['full_name'] as String?,
      resident_code: json['resident_code'] as String?,
      email: json['email'] as String?,
      confirm_password: json['confirm_password'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AddFamilyMemberDataModelToJson(
        AddFamilyMemberDataModel instance) =>
    <String, dynamic>{
      'resident_code': instance.resident_code,
      'resident_phone': instance.resident_phone,
      'email': instance.email,
      'full_name': instance.full_name,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
    };
