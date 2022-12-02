import 'package:json_annotation/json_annotation.dart';

part 'createCommercialData.g.dart';

@JsonSerializable()
class CreateCommercialDataModel {
  String? resident_phone;
  String? surname;
  String? firstname;
  String? email;
  String? password;
  String? confirm_password;
  String? resident_type;
  String? address;
  String? zone;
  String? business_name;
  String? staff_numbers;
  String? mobile_number;
  String? business_email;
  String? category;
  String? street_address;

  CreateCommercialDataModel(
      {this.zone,
      this.resident_type,
      this.email,
      this.address,
      this.password,
      this.firstname,
      this.surname,
      this.resident_phone,
      this.category,
      this.business_email,
      this.mobile_number,
      this.street_address,
      this.business_name,
      this.confirm_password,
      this.staff_numbers});

  factory CreateCommercialDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommercialDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommercialDataModelToJson(this);
}
