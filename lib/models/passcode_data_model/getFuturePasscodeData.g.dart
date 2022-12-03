// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getFuturePasscodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFuturePasscodeDataModel _$GetFuturePasscodeDataModelFromJson(
        Map<String, dynamic> json) =>
    GetFuturePasscodeDataModel(
      visitor_name: json['visitor_name'] as String?,
      number_visitor: json['number_visitor'] as String?,
      resident_code: json['resident_code'] as String?,
      msisdn: json['msisdn'] as String?,
      arival_date: json['arival_date'] as String?,
      time_from: json['time_from'] as String?,
      time_to: json['time_to'] as String?,
    );

Map<String, dynamic> _$GetFuturePasscodeDataModelToJson(
        GetFuturePasscodeDataModel instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
      'visitor_name': instance.visitor_name,
      'resident_code': instance.resident_code,
      'number_visitor': instance.number_visitor,
      'arival_date': instance.arival_date,
      'time_from': instance.time_from,
      'time_to': instance.time_to,
    };
