// To parse this JSON data, do
//
//     final families = familiesFromJson(jsonString);

import 'dart:convert';

Families familiesFromJson(String str) => Families.fromJson(json.decode(str));

String familiesToJson(Families data) => json.encode(data.toJson());

class Families {
  Families({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<Family> data;

  factory Families.fromJson(Map<String, dynamic> json) => Families(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Family>.from(json["data"].map((x) => Family.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Family {
  Family({
    required this.residentCode,
    required this.email,
    required this.status,
    required this.fullName,
    required this.validityStartsDate,
    required this.validityEndsDate,
    required this.lastLoginDate,
    required this.rowNumber,
  });

  String? residentCode;
  String? email;
  String? status;
  String? fullName;
  String? validityStartsDate;
  String? validityEndsDate;
  String? lastLoginDate;
  String? rowNumber;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
    residentCode: json["RESIDENT_CODE"],
    email: json["EMAIL"],
    status: json["STATUS"],
    fullName: json["FULL_NAME"],
    validityStartsDate: json["VALIDITY_STARTS_DATE"],
    validityEndsDate: json["VALIDITY_ENDS_DATE"],
    lastLoginDate: json["LAST_LOGIN_DATE"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "RESIDENT_CODE": residentCode,
    "EMAIL": email,
    "STATUS": status,
    "FULL_NAME": fullName,
    "VALIDITY_STARTS_DATE": validityStartsDate,
    "VALIDITY_ENDS_DATE": validityEndsDate,
    "LAST_LOGIN_DATE": lastLoginDate,
    "ROW_NUMBER": rowNumber,
  };
}
