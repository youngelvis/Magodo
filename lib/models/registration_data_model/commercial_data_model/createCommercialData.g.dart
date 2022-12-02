// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createCommercialData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommercialDataModel _$CreateCommercialDataModelFromJson(
        Map<String, dynamic> json) =>
    CreateCommercialDataModel(
      zone: json['zone'] as String?,
      resident_type: json['resident_type'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      password: json['password'] as String?,
      firstname: json['firstname'] as String?,
      surname: json['surname'] as String?,
      resident_phone: json['resident_phone'] as String?,
      category: json['category'] as String?,
      business_email: json['business_email'] as String?,
      mobile_number: json['mobile_number'] as String?,
      street_address: json['street_address'] as String?,
      business_name: json['business_name'] as String?,
      confirm_password: json['confirm_password'] as String?,
      staff_numbers: json['staff_numbers'] as String?,
    );

Map<String, dynamic> _$CreateCommercialDataModelToJson(
        CreateCommercialDataModel instance) =>
    <String, dynamic>{
      'resident_phone': instance.resident_phone,
      'surname': instance.surname,
      'firstname': instance.firstname,
      'email': instance.email,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
      'resident_type': instance.resident_type,
      'address': instance.address,
      'zone': instance.zone,
      'business_name': instance.business_name,
      'staff_numbers': instance.staff_numbers,
      'mobile_number': instance.mobile_number,
      'business_email': instance.business_email,
      'category': instance.category,
      'street_address': instance.street_address,
    };
