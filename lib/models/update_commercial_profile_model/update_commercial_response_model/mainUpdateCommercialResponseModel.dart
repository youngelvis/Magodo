import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/update_commercial_profile_model/update_commercial_response_model/updateCommercialResponse.dart';

part 'mainUpdateCommercialResponseModel.g.dart';

@JsonSerializable()
class MainUpdateCommercialResponseModel {
  bool? error;
  String? message;
  int? code;
  UpdateCommercialResponseModel? data;
  MainUpdateCommercialResponseModel({this.error, this.message, this.code, this.data});

  factory MainUpdateCommercialResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainUpdateCommercialResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainUpdateCommercialResponseModelToJson(this);
}