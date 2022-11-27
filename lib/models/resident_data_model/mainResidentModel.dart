import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';

part 'mainResidentModel.g.dart';

@JsonSerializable()
class MainResidentModel {
  bool? error;
  String? message;
  int? code;
  ResidentModel? data;

  MainResidentModel({this.error, this.message, this.code, this.data});

  factory MainResidentModel.fromJson(Map<String, dynamic> json) =>
      _$MainResidentModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainResidentModelToJson(this);
}
