import 'package:json_annotation/json_annotation.dart';

part 'updateCommercialData.g.dart';

@JsonSerializable()
class UpdateCommercialDataModel {
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
  String? street_address;
  String? business_name;
  String? staff_number;
  String? mobile_number;
  String? business_email;
  String? category;

  UpdateCommercialDataModel(
      {this.address,
      this.resident_type,
      this.resident_code,
      this.status,
      this.full_name,
      this.mra_zone,
      this.user_group,
      this.validity_ends_date,
      this.validity_starts_date,
      this.email,
      this.resident_phone,
      this.business_name,
      this.street_address,
      this.business_email,
      this.category,
      this.mobile_number,
      this.staff_number});

  factory UpdateCommercialDataModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCommercialDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCommercialDataModelToJson(this);
}
