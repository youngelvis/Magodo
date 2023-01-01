// To parse this JSON data, do
//
//     final residentReports = residentReportsFromJson(jsonString);

import 'dart:convert';

ResidentReports residentReportsFromJson(String str) => ResidentReports.fromJson(json.decode(str));

String residentReportsToJson(ResidentReports data) => json.encode(data.toJson());

class ResidentReports {
  ResidentReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<ResidentReport> data;

  factory ResidentReports.fromJson(Map<String, dynamic> json) => ResidentReports(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<ResidentReport>.from(json["data"].map((x) => ResidentReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ResidentReport {
  ResidentReport({
    required this.residentCode,
    required this.fullName,
    required this.msisdn,
    required this.status,
    required this.mraZone,
    required this.userGroup,
    required this.address,
    required this.businessName,
    required this.residentType,
    required this.validityStartsDate,
    required this.validityEndsDate,
    required this.createdDate,
    required this.rowNumber,
  });

  String? residentCode;
  String? fullName;
  String? msisdn;
  String? status;
  String? mraZone;
  String? userGroup;
  String? address;
  String? businessName;
  String? residentType;
  String? validityStartsDate;
  String? validityEndsDate;
  String? createdDate;
  String? rowNumber;

  factory ResidentReport.fromJson(Map<String, dynamic> json) => ResidentReport(
    residentCode: json["RESIDENT_CODE"],
    fullName: json["FULL_NAME"],
    msisdn: json["MSISDN"],
    status: json["STATUS"],
    mraZone: json["MRA_ZONE"],
    userGroup: json["USER_GROUP"],
    address: json["ADDRESS"],
    businessName: json["BUSINESS_NAME"],
    residentType: json["RESIDENT_TYPE"],
    validityStartsDate: json["VALIDITY_STARTS_DATE"],
    validityEndsDate:json["VALIDITY_ENDS_DATE"],
    createdDate: json["CREATED_DATE"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "RESIDENT_CODE": residentCode,
    "FULL_NAME": fullName,
    "MSISDN": msisdn,
    "STATUS": status,
    "MRA_ZONE": mraZone,
    "USER_GROUP": userGroup,
    "ADDRESS": address,
    "BUSINESS_NAME": businessName,
    "RESIDENT_TYPE": residentType,
    "VALIDITY_STARTS_DATE": validityStartsDate,
    "VALIDITY_ENDS_DATE": validityStartsDate,
    "CREATED_DATE": createdDate,
    "ROW_NUMBER": rowNumber,
  };
}
