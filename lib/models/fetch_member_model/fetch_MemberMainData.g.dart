// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_MemberMainData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchMemberMainData _$FetchMemberMainDataFromJson(Map<String, dynamic> json) =>
    FetchMemberMainData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FetchMemberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchMemberMainDataToJson(
        FetchMemberMainData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
