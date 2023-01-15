import 'package:json_annotation/json_annotation.dart';

part 'residentdata.g.dart';

@JsonSerializable()
class ResidentModel {
  String? firstname;
  String? surname;
  String? resident_code;
  String? msisdn;
  String? email;
  String? address;
  String? usr_group;
  String? zone;
  String? usr_full_name;
  String? validity_starts;
  String? validity_ends;
  String? user_status;
  String? created_date;
  String? last_login_date;
  String? resident_type;
  String? street_address;
  String? Business_name;
  String? mobile_number;
  String? business_email;
  String? category;
  String? authorized_by;
  String? authorized_date;

  ResidentModel(
      {this.resident_code,
      this.msisdn,
      this.email,
      this.address,
      this.usr_group,
      this.zone,
      this.usr_full_name,
      this.validity_starts,
      this.validity_ends,
      this.user_status,
      this.created_date,
      this.last_login_date,
      this.resident_type,
      this.street_address,
      this.Business_name,
      this.mobile_number,
      this.business_email,
      this.category,
      this.authorized_by,
      this.authorized_date,
      this.firstname,
      this.surname});

  factory ResidentModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentModelToJson(this);
}
