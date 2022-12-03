import 'package:json_annotation/json_annotation.dart';

part 'addStaffData.g.dart';

@JsonSerializable()
class AddStaffDataModel {
  String? resident_reg_code;
  String? resident_phone;
  String? full_name;
  String? employ_starts;
  String? dependant_phone;
  String? relationship;
  String? employment_status;
  String? contact_detail;

  AddStaffDataModel(
      {this.full_name,
      this.resident_phone,
      this.resident_reg_code,
      this.relationship,
      this.contact_detail,
      this.dependant_phone,
      this.employ_starts,
      this.employment_status});

  factory AddStaffDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddStaffDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddStaffDataModelToJson(this);
}
