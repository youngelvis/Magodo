import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/passcode_data_model/passcodeData.dart';

part 'mainPasscodeData.g.dart';

@JsonSerializable()
class MainPasscodeDataModel {
  bool? error;
  String? message;
  int? code;
  PasscodeDataModel? data;
  MainPasscodeDataModel({this.error, this.message, this.code, this.data});

  factory MainPasscodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$MainPasscodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainPasscodeDataModelToJson(this);
}