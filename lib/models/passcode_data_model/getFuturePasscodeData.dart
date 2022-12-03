// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'getFuturePasscodeData.g.dart';

@JsonSerializable()
class GetFuturePasscodeDataModel {
  String? msisdn;
  String? visitor_name;
  String? resident_code;
  String? number_visitor;
  String? arival_date;
  String? time_from;
  String? time_to;

  GetFuturePasscodeDataModel(
      {this.visitor_name,
      this.number_visitor,
      this.resident_code,
      this.msisdn,
      this.arival_date,
      this.time_from,
      this.time_to});

  factory GetFuturePasscodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetFuturePasscodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFuturePasscodeDataModelToJson(this);
}
