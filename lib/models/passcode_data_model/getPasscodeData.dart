import 'package:json_annotation/json_annotation.dart';

part 'getPasscodeData.g.dart';

@JsonSerializable()
class GetPasscodeDataModel {

  String? msisdn;
  String? visitor_name;
  String? resident_code;
  String? number_visitor;


  GetPasscodeDataModel({this.msisdn,this.resident_code,this.number_visitor,this.visitor_name});

  factory GetPasscodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetPasscodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPasscodeDataModelToJson(this);
}