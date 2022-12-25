import 'package:json_annotation/json_annotation.dart';

part 'fetch_memberData.g.dart';

@JsonSerializable()
class FetchMemberData {
  String? RESIDENT_CODE;
  String? MRA_ZONE;
  String? MSISDN;
  String? EMAIL;
  String? ADDRESS;
  String? USER_GROUP;
  String? FULL_NAME;
  String? STATUS;
  String? CREATED_DATE;
  String? LAST_LOGIN_DATE;

  FetchMemberData(
      {this.RESIDENT_CODE,
      this.MRA_ZONE,
      this.ADDRESS,
      this.MSISDN,
      this.CREATED_DATE,
      this.EMAIL,
      this.FULL_NAME,
      this.LAST_LOGIN_DATE,
      this.STATUS,
      this.USER_GROUP});

  factory FetchMemberData.fromJson(Map<String, dynamic> json) =>
      _$FetchMemberDataFromJson(json);

  Map<String, dynamic> toJson() => _$FetchMemberDataToJson(this);
}
