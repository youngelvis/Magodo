// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainErrorHandler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainErrorHandler _$MainErrorHandlerFromJson(Map<String, dynamic> json) =>
    MainErrorHandler(
      error: json['error'] == null
          ? null
          : MainErrorHandler.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainErrorHandlerToJson(MainErrorHandler instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
