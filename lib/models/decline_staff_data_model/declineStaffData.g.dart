// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declineStaffData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeclineStaffDataModel _$DeclineStaffDataModelFromJson(
        Map<String, dynamic> json) =>
    DeclineStaffDataModel(
      guid_staff: json['guid_staff'] as String?,
      action_user_resident_code: json['action_user_resident_code'] as String?,
    );

Map<String, dynamic> _$DeclineStaffDataModelToJson(
        DeclineStaffDataModel instance) =>
    <String, dynamic>{
      'guid_staff': instance.guid_staff,
      'action_user_resident_code': instance.action_user_resident_code,
    };
