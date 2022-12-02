import 'package:json_annotation/json_annotation.dart';

part 'updateResidentResponseData.g.dart';

@JsonSerializable()
class UpdateResidentResponseModel {
  String? resident_code;
  String? msisdn;
  String? full_name;
  String? status;
  String? user_group;
  String? address;
  String? resident_type;
  String? mra_zone;
  String? validity_starts_date;
  String? validity_ends_date;

  UpdateResidentResponseModel(
      {this.validity_starts_date,
      this.validity_ends_date,
      this.user_group,
      this.mra_zone,
      this.full_name,
      this.status,
      this.resident_code,
      this.resident_type,
      this.address,
      this.msisdn});

  factory UpdateResidentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateResidentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResidentResponseModelToJson(this);
}
