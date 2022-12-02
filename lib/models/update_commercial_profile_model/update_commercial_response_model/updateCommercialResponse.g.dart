// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateCommercialResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommercialResponseModel _$UpdateCommercialResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateCommercialResponseModel(
      staff_number: json['staff_number'] as String?,
      mobile_number: json['mobile_number'] as String?,
      category: json['category'] as String?,
      business_email: json['business_email'] as String?,
      street_address: json['street_address'] as String?,
      business_name: json['business_name'] as String?,
      validity_starts_date: json['validity_starts_date'] as String?,
      validity_ends_date: json['validity_ends_date'] as String?,
      user_group: json['user_group'] as String?,
      mra_zone: json['mra_zone'] as String?,
      full_name: json['full_name'] as String?,
      status: json['status'] as String?,
      resident_code: json['resident_code'] as String?,
      resident_type: json['resident_type'] as String?,
      address: json['address'] as String?,
      msisdn: json['msisdn'] as String?,
    );

Map<String, dynamic> _$UpdateCommercialResponseModelToJson(
        UpdateCommercialResponseModel instance) =>
    <String, dynamic>{
      'resident_code': instance.resident_code,
      'msisdn': instance.msisdn,
      'full_name': instance.full_name,
      'status': instance.status,
      'user_group': instance.user_group,
      'address': instance.address,
      'resident_type': instance.resident_type,
      'mra_zone': instance.mra_zone,
      'validity_starts_date': instance.validity_starts_date,
      'validity_ends_date': instance.validity_ends_date,
      'street_address': instance.street_address,
      'business_name': instance.business_name,
      'staff_number': instance.staff_number,
      'mobile_number': instance.mobile_number,
      'business_email': instance.business_email,
      'category': instance.category,
    };
