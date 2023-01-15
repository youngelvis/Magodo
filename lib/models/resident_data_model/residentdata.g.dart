// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residentdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidentModel _$ResidentModelFromJson(Map<String, dynamic> json) =>
    ResidentModel(
      resident_code: json['resident_code'] as String?,
      msisdn: json['msisdn'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      usr_group: json['usr_group'] as String?,
      zone: json['zone'] as String?,
      usr_full_name: json['usr_full_name'] as String?,
      validity_starts: json['validity_starts'] as String?,
      validity_ends: json['validity_ends'] as String?,
      user_status: json['user_status'] as String?,
      created_date: json['created_date'] as String?,
      last_login_date: json['last_login_date'] as String?,
      resident_type: json['resident_type'] as String?,
      street_address: json['street_address'] as String?,
      Business_name: json['Business_name'] as String?,
      mobile_number: json['mobile_number'] as String?,
      business_email: json['business_email'] as String?,
      category: json['category'] as String?,
      authorized_by: json['authorized_by'] as String?,
      authorized_date: json['authorized_date'] as String?,
      firstname: json['firstname'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$ResidentModelToJson(ResidentModel instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'surname': instance.surname,
      'resident_code': instance.resident_code,
      'msisdn': instance.msisdn,
      'email': instance.email,
      'address': instance.address,
      'usr_group': instance.usr_group,
      'zone': instance.zone,
      'usr_full_name': instance.usr_full_name,
      'validity_starts': instance.validity_starts,
      'validity_ends': instance.validity_ends,
      'user_status': instance.user_status,
      'created_date': instance.created_date,
      'last_login_date': instance.last_login_date,
      'resident_type': instance.resident_type,
      'street_address': instance.street_address,
      'Business_name': instance.Business_name,
      'mobile_number': instance.mobile_number,
      'business_email': instance.business_email,
      'category': instance.category,
      'authorized_by': instance.authorized_by,
      'authorized_date': instance.authorized_date,
    };
