// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewSentPasscodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewSentPasscodeDataModel _$ViewSentPasscodeDataModelFromJson(
        Map<String, dynamic> json) =>
    ViewSentPasscodeDataModel(
      resident_code: json['resident_code'] as String?,
      search: json['search'] as String?,
      limit: json['limit'] as String?,
      page: json['page'] as String?,
    );

Map<String, dynamic> _$ViewSentPasscodeDataModelToJson(
        ViewSentPasscodeDataModel instance) =>
    <String, dynamic>{
      'resident_code': instance.resident_code,
      'page': instance.page,
      'limit': instance.limit,
      'search': instance.search,
    };
