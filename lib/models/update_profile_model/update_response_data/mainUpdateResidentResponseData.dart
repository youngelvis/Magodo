import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/update_profile_model/updateResidentData.dart';

part 'mainUpdateResidentResponseData.g.dart';

@JsonSerializable()
class MainUpdateResidentResponseDataModel {
  bool? error;
  String? message;
  int? code;
  UpdateResidentDataModel? data;
  MainUpdateResidentResponseDataModel({this.error, this.message, this.code, this.data});

  factory MainUpdateResidentResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$MainUpdateResidentResponseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainUpdateResidentResponseDataModelToJson(this);
}