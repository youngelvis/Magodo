import 'package:json_annotation/json_annotation.dart';

part 'registrationData.g.dart';

@JsonSerializable()
class RegistrationDataModel {
  String? Resident_code;
  String? residentType;
  RegistrationDataModel({this.Resident_code, this.residentType});

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationDataModelToJson(this);
}