// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateResidentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResidentDataModel _$UpdateResidentDataModelFromJson(
        Map<String, dynamic> json) =>
    UpdateResidentDataModel(
      resident_phone: json['resident_phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      resident_type: json['resident_type'] as String?,
      resident_code: json['resident_code'] as String?,
      status: json['status'] as String?,
      full_name: json['full_name'] as String?,
      mra_zone: json['mra_zone'] as String?,
      user_group: json['user_group'] as String?,
      validity_ends_date: json['validity_ends_date'] as String?,
      validity_starts_date: json['validity_starts_date'] as String?,
    );

Map<String, dynamic> _$UpdateResidentDataModelToJson(
        UpdateResidentDataModel instance) =>
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
    };
