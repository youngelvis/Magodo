import 'package:json_annotation/json_annotation.dart';

part 'updateCommercialResponse.g.dart';

@JsonSerializable()
class UpdateCommercialResponseModel {
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
  String? street_address;
  String? business_name;
  String? staff_number;
  String? mobile_number;
  String? business_email;
  String? category;

  UpdateCommercialResponseModel(
      {this.staff_number,
      this.mobile_number,
      this.category,
      this.business_email,
      this.street_address,
      this.business_name,
      this.validity_starts_date,
      this.validity_ends_date,
      this.user_group,
      this.mra_zone,
      this.full_name,
      this.status,
      this.resident_code,
      this.resident_type,
      this.address,
      this.msisdn});

  factory UpdateCommercialResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCommercialResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateCommercialResponseModelToJson(this);
}
