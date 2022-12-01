// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createResidentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateResidentDataModel _$CreateResidentDataModelFromJson(
        Map<String, dynamic> json) =>
    CreateResidentDataModel(
      resident_phone: json['resident_phone'] as String?,
      surname: json['surname'] as String?,
      firstname: json['firstname'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      resident_type: json['resident_type'] as String?,
      zone: json['zone'] as String?,
      confirm_password: json['confirm_password'] as String?,
    );

Map<String, dynamic> _$CreateResidentDataModelToJson(
        CreateResidentDataModel instance) =>
    <String, dynamic>{
      'resident_phone': instance.resident_phone,
      'surname': instance.surname,
      'firstname': instance.firstname,
      'email': instance.email,
      'resident_type': instance.resident_type,
      'address': instance.address,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
      'zone': instance.zone,
    };
