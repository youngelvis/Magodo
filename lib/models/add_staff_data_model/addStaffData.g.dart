// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addStaffData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStaffDataModel _$AddStaffDataModelFromJson(Map<String, dynamic> json) =>
    AddStaffDataModel(
      full_name: json['full_name'] as String?,
      resident_phone: json['resident_phone'] as String?,
      resident_reg_code: json['resident_reg_code'] as String?,
      relationship: json['relationship'] as String?,
      contact_detail: json['contact_detail'] as String?,
      dependant_phone: json['dependant_phone'] as String?,
      employ_starts: json['employ_starts'] as String?,
      employment_status: json['employment_status'] as String?,
    );

Map<String, dynamic> _$AddStaffDataModelToJson(AddStaffDataModel instance) =>
    <String, dynamic>{
      'resident_reg_code': instance.resident_reg_code,
      'resident_phone': instance.resident_phone,
      'full_name': instance.full_name,
      'employ_starts': instance.employ_starts,
      'dependant_phone': instance.dependant_phone,
      'relationship': instance.relationship,
      'employment_status': instance.employment_status,
      'contact_detail': instance.contact_detail,
    };
