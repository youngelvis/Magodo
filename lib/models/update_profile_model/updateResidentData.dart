import 'package:json_annotation/json_annotation.dart';

part 'updateResidentData.g.dart';

@JsonSerializable()
class UpdateResidentDataModel {
  String? resident_code;
  String? full_name;
  String? resident_phone;
  String? email;
  String? user_group;
  String? status;
  String? mra_zone;
  String? resident_type;
  String? address;
  String? validity_starts_date;
  String? validity_ends_date;

  UpdateResidentDataModel(
      {this.resident_phone,
      this.email,
      this.address,
      this.resident_type,
      this.resident_code,
      this.status,
      this.full_name,
      this.mra_zone,
      this.user_group,
      this.validity_ends_date,
      this.validity_starts_date});

  factory UpdateResidentDataModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateResidentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResidentDataModelToJson(this);
}
