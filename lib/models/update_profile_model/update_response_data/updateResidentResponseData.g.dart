// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateResidentResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResidentResponseModel _$UpdateResidentResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateResidentResponseModel(
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

Map<String, dynamic> _$UpdateResidentResponseModelToJson(
        UpdateResidentResponseModel instance) =>
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
    };
