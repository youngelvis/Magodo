import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/fetch_member_model/fetch_memberData.dart';

part 'fetch_MemberMainData.g.dart';

@JsonSerializable()
class FetchMemberMainData {
 List <FetchMemberData?>? data;

  FetchMemberMainData({ this.data,});

  factory FetchMemberMainData.fromJson(Map<String, dynamic> json) =>
      _$FetchMemberMainDataFromJson(json);

  Map<String, dynamic> toJson() => _$FetchMemberMainDataToJson(this);
}