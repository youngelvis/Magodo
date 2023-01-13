// To parse this JSON data, do
//
//     final breakDownSummaries = breakDownSummariesFromJson(jsonString);

import 'dart:convert';

BreakDownSummaries? breakDownSummariesFromJson(String str) => BreakDownSummaries.fromJson(json.decode(str));

String breakDownSummariesToJson(BreakDownSummaries? data) => json.encode(data!.toJson());

class BreakDownSummaries {
  BreakDownSummaries({
    this.data,
    this.error,
    this.message,
    this.code,
  });

  Data? data;
  bool? error;
  String? message;
  int? code;

  factory BreakDownSummaries.fromJson(Map<String, dynamic> json) => BreakDownSummaries(
    data: Data.fromJson(json["data"]),
    error: json["error"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "error": error,
    "message": message,
    "code": code,
  };
}

class Data {
  Data({
    this.totalMembers,
    this.totalFamilyMembers,
    this.totalStaffs,
    this.totalCoordinators,
    this.totalPropertyOwners,
    this.totalCommercialResident,
  });

  int? totalMembers;
  int? totalFamilyMembers;
  int? totalStaffs;
  int? totalCoordinators;
  int? totalPropertyOwners;
  int? totalCommercialResident;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalMembers: json["TotalMembers"],
    totalFamilyMembers: json["TotalFamilyMembers"],
    totalStaffs: json["TotalStaffs"],
    totalCoordinators: json["TotalCoordinators"],
    totalPropertyOwners: json["TotalPropertyOwners"],
    totalCommercialResident: json["TotalCommercialResident"],
  );

  Map<String, dynamic> toJson() => {
    "TotalMembers": totalMembers,
    "TotalFamilyMembers": totalFamilyMembers,
    "TotalStaffs": totalStaffs,
    "TotalCoordinators": totalCoordinators,
    "TotalPropertyOwners": totalPropertyOwners,
    "TotalCommercialResident": totalCommercialResident,
  };
}
