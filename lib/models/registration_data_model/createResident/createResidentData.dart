import 'package:json_annotation/json_annotation.dart';

part 'createResidentData.g.dart';

@JsonSerializable()
class CreateResidentDataModel {
  String? resident_phone;
  String? surname;
  String? firstname;
  String? email;
  String? resident_type;
  String? address;
  String? password;
  String? confirm_password;
  String? zone;

  CreateResidentDataModel(
      {this.resident_phone,
      this.surname,
      this.firstname,
      this.password,
      this.address,
      this.email,
      this.resident_type,
      this.zone,
      this.confirm_password});

  factory CreateResidentDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateResidentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateResidentDataModelToJson(this);
}
