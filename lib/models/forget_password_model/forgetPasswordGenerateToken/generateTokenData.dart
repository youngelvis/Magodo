import 'package:json_annotation/json_annotation.dart';

part 'generateTokenData.g.dart';

@JsonSerializable()
class GenerateTokenDataModel {

  String? resident_reg_code;
  String? email;
  String? resident_phone;


  GenerateTokenDataModel({this.resident_phone,this.email, this.resident_reg_code});

  factory GenerateTokenDataModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateTokenDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateTokenDataModelToJson(this);
}