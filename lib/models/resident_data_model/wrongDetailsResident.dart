import 'package:json_annotation/json_annotation.dart';

part 'wrongDetailsResident.g.dart';

@JsonSerializable()
class WrongDetailsResident {
  List? data;
  bool? error;
  String? message;
  int? code;


  WrongDetailsResident({this.error, this.message, this.code, this.data});

  factory WrongDetailsResident.fromJson(Map<String, dynamic> json) =>
      _$WrongDetailsResidentFromJson(json);

  Map<String, dynamic> toJson() => _$WrongDetailsResidentToJson(this);
}