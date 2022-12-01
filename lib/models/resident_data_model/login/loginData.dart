import 'package:json_annotation/json_annotation.dart';

part 'loginData.g.dart';

@JsonSerializable()
class LoginData {
  String? resident_code;
  String? password;

  LoginData({this.resident_code, this.password});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}