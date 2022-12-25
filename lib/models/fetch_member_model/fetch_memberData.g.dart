// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_memberData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchMemberData _$FetchMemberDataFromJson(Map<String, dynamic> json) =>
    FetchMemberData(
      RESIDENT_CODE: json['RESIDENT_CODE'] as String?,
      MRA_ZONE: json['MRA_ZONE'] as String?,
      ADDRESS: json['ADDRESS'] as String?,
      MSISDN: json['MSISDN'] as String?,
      CREATED_DATE: json['CREATED_DATE'] as String?,
      EMAIL: json['EMAIL'] as String?,
      FULL_NAME: json['FULL_NAME'] as String?,
      LAST_LOGIN_DATE: json['LAST_LOGIN_DATE'] as String?,
      STATUS: json['STATUS'] as String?,
      USER_GROUP: json['USER_GROUP'] as String?,
    );

Map<String, dynamic> _$FetchMemberDataToJson(FetchMemberData instance) =>
    <String, dynamic>{
      'RESIDENT_CODE': instance.RESIDENT_CODE,
      'MRA_ZONE': instance.MRA_ZONE,
      'MSISDN': instance.MSISDN,
      'EMAIL': instance.EMAIL,
      'ADDRESS': instance.ADDRESS,
      'USER_GROUP': instance.USER_GROUP,
      'FULL_NAME': instance.FULL_NAME,
      'STATUS': instance.STATUS,
      'CREATED_DATE': instance.CREATED_DATE,
      'LAST_LOGIN_DATE': instance.LAST_LOGIN_DATE,
    };
