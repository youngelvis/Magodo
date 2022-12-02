// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateCommercialData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommercialDataModel _$UpdateCommercialDataModelFromJson(
        Map<String, dynamic> json) =>
    UpdateCommercialDataModel(
      address: json['address'] as String?,
      resident_type: json['resident_type'] as String?,
      resident_code: json['resident_code'] as String?,
      status: json['status'] as String?,
      full_name: json['full_name'] as String?,
      mra_zone: json['mra_zone'] as String?,
      user_group: json['user_group'] as String?,
      validity_ends_date: json['validity_ends_date'] as String?,
      validity_starts_date: json['validity_starts_date'] as String?,
      email: json['email'] as String?,
      resident_phone: json['resident_phone'] as String?,
      business_name: json['business_name'] as String?,
      street_address: json['street_address'] as String?,
      business_email: json['business_email'] as String?,
      category: json['category'] as String?,
      mobile_number: json['mobile_number'] as String?,
      staff_number: json['staff_number'] as String?,
    );

Map<String, dynamic> _$UpdateCommercialDataModelToJson(
        UpdateCommercialDataModel instance) =>
    <String, dynamic>{
      'resident_code': instance.resident_code,
      'full_name': instance.full_name,
      'resident_phone': instance.resident_phone,
      'email': instance.email,
      'user_group': instance.user_group,
      'status': instance.status,
      'mra_zone': instance.mra_zone,
      'resident_type': instance.resident_type,
      'address': instance.address,
      'validity_starts_date': instance.validity_starts_date,
      'validity_ends_date': instance.validity_ends_date,
      'street_address': instance.street_address,
      'business_name': instance.business_name,
      'staff_number': instance.staff_number,
      'mobile_number': instance.mobile_number,
      'business_email': instance.business_email,
      'category': instance.category,
    };
