// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getPasscodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPasscodeDataModel _$GetPasscodeDataModelFromJson(
        Map<String, dynamic> json) =>
    GetPasscodeDataModel(
      msisdn: json['msisdn'] as String?,
      resident_code: json['resident_code'] as String?,
      number_visitor: json['number_visitor'] as String?,
      visitor_name: json['visitor_name'] as String?,
    );

Map<String, dynamic> _$GetPasscodeDataModelToJson(
        GetPasscodeDataModel instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
      'visitor_name': instance.visitor_name,
      'resident_code': instance.resident_code,
      'number_visitor': instance.number_visitor,
    };
