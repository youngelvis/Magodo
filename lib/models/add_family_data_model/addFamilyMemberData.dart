// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'addFamilyMemberData.g.dart';

@JsonSerializable()
class AddFamilyMemberDataModel {
  String? resident_code;
  String? resident_phone;
  String? email;
  String? full_name;
  String? password;
  String? confirm_password;

  AddFamilyMemberDataModel(
      {this.resident_phone,
      this.full_name,
      this.resident_code,
      this.email,
      this.confirm_password,
      this.password});

  factory AddFamilyMemberDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddFamilyMemberDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFamilyMemberDataModelToJson(this);
}
