// To parse this JSON data, do
//
//     final viewMembers = viewMembersFromJson(jsonString);

import 'dart:convert';

ViewMembers viewMembersFromJson(String str) => ViewMembers.fromJson(json.decode(str));

String viewMembersToJson(ViewMembers data) => json.encode(data.toJson());

class ViewMembers {
  ViewMembers({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<ViewMember> data;

  factory ViewMembers.fromJson(Map<String, dynamic> json) => ViewMembers(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<ViewMember>.from(json["data"].map((x) => ViewMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ViewMember {
  ViewMember({
    required this.residentCode,
    required this.email,
    required this.msisdn,
    required this.address,
    required this.residentType,
    required this.category,
    required  this.userGroup,
    required this.fullName,
    required  this.status,
    required this.mraZone,
    required this.validityStartsDate,
    required  this.validityEndsDate,
    required  this.createdDate,
    required this.lastLoginDate,
    required  this.authorizedBy,
    required  this.authorizedDate,
  });

  String? residentCode;
  String? email;
  String? msisdn;
  String? address;
  String? residentType;
  String? category;
  String? userGroup;
  String? fullName;
  String? status;
  String? mraZone;
  String? validityStartsDate;
  String? validityEndsDate;
  String? createdDate;
  String? lastLoginDate;
  String? authorizedBy;
  String? authorizedDate;

  factory ViewMember.fromJson(Map<String, dynamic> json) => ViewMember(
    residentCode: json["RESIDENT_CODE"],
    email: json["EMAIL"],
    msisdn: json["MSISDN"],
    address: json["ADDRESS"],
    residentType: json["RESIDENT_TYPE"],
    category: json["CATEGORY"],
    userGroup: json["USER_GROUP"],
    fullName: json["FULL_NAME"],
    status: json["STATUS"],
    mraZone: json["MRA_ZONE"],
    validityStartsDate: json["VALIDITY_STARTS_DATE"],
    validityEndsDate: json["VALIDITY_ENDS_DATE"],
    createdDate: json["CREATED_DATE"],
    lastLoginDate: json["LAST_LOGIN_DATE"],
    authorizedBy: json["AUTHORIZED_BY"],
    authorizedDate: json["AUTHORIZED_DATE"],
  );

  Map<String, dynamic> toJson() => {
    "RESIDENT_CODE": residentCode,
    "EMAIL": email,
    "MSISDN": msisdn,
    "ADDRESS": address,
    "RESIDENT_TYPE": residentType,
    "CATEGORY": category,
    "USER_GROUP": userGroup,
    "FULL_NAME": fullName,
    "STATUS": status,
    "MRA_ZONE": mraZone,
    "VALIDITY_STARTS_DATE": validityStartsDate,
    "VALIDITY_ENDS_DATE": validityEndsDate,
    "CREATED_DATE": createdDate,
    "LAST_LOGIN_DATE": lastLoginDate,
    "AUTHORIZED_BY": authorizedBy,
    "AUTHORIZED_DATE": authorizedDate,
  };
}
