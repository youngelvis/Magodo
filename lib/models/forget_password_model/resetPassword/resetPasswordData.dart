import 'package:json_annotation/json_annotation.dart';

part 'resetPasswordData.g.dart';

@JsonSerializable()
class ResetPasswordModel {
  String? token;
  String? new_password;
  String? confirm_password;

  ResetPasswordModel({this.confirm_password, this.new_password, this.token});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}

