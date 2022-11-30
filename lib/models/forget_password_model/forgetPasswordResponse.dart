import 'package:json_annotation/json_annotation.dart';
part 'forgetPasswordResponse.g.dart';
@JsonSerializable()
class ForgetPasswordResponse {
  List? data;
  bool? error;
  String? message;
  int? code;


  ForgetPasswordResponse({this.error, this.message, this.code, this.data});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}