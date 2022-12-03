// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'declineStaffData.g.dart';

@JsonSerializable()
class DeclineStaffDataModel {

  String? guid_staff;
  String? action_user_resident_code;

  DeclineStaffDataModel(
      {this.guid_staff,this.action_user_resident_code});

  factory DeclineStaffDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeclineStaffDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeclineStaffDataModelToJson(this);
}
