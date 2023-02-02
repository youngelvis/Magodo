import 'package:json_annotation/json_annotation.dart';

part 'fetch_memberData.g.dart';

@JsonSerializable()
class FetchMemberData {
  String? RESIDENT_CODE;
  String? FULL_NAME;


  FetchMemberData(
      {this.RESIDENT_CODE,

      this.FULL_NAME,});

  factory FetchMemberData.fromJson(Map<String, dynamic> json) =>
      _$FetchMemberDataFromJson(json);

  Map<String, dynamic> toJson() => _$FetchMemberDataToJson(this);
}
