import 'package:json_annotation/json_annotation.dart';

part 'mainRegistrationData.g.dart';

@JsonSerializable()
class MainRegistrationDataModel {
  bool? error;
  String? message;
  int? code;
  MainRegistrationDataModel? data;
  MainRegistrationDataModel({this.error, this.message, this.code, this.data});

  factory MainRegistrationDataModel.fromJson(Map<String, dynamic> json) =>
      _$MainRegistrationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainRegistrationDataModelToJson(this);
}