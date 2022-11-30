import 'package:json_annotation/json_annotation.dart';

part 'passcodeData.g.dart';

@JsonSerializable()
class PasscodeDataModel {
  String? visitor_number;

  PasscodeDataModel({this.visitor_number});

  factory PasscodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$PasscodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasscodeDataModelToJson(this);
}