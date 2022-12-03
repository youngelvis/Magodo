import 'package:json_annotation/json_annotation.dart';

part 'viewSentPasscodeData.g.dart';

@JsonSerializable()
class ViewSentPasscodeDataModel {
  String? resident_code;
  String? page;
  String? limit;
  String? search;

  ViewSentPasscodeDataModel({this.resident_code, this.search, this.limit, this.page});

  factory ViewSentPasscodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$ViewSentPasscodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewSentPasscodeDataModelToJson(this);
}
