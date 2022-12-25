// To parse this JSON data, do
//
//     final activityLogReports = activityLogReportsFromJson(jsonString);

import 'dart:convert';

ActivityLogReports activityLogReportsFromJson(String str) => ActivityLogReports.fromJson(json.decode(str));

String activityLogReportsToJson(ActivityLogReports data) => json.encode(data.toJson());

class ActivityLogReports {
  ActivityLogReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<ActivityLogReport> data;

  factory ActivityLogReports.fromJson(Map<String, dynamic> json) => ActivityLogReports(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<ActivityLogReport>.from(json["data"].map((x) => ActivityLogReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActivityLogReport {
  ActivityLogReport({
    required this.residentCode,
    required this.fullName,
    required  this.action,
    required this.actionDescription,
    required this.otherDetails,
    required this.actionUser,
    required this.createdDate,
    required this.rowNumber,
  });

  String residentCode;
  String fullName;
  String action;
  String actionDescription;
  String otherDetails;
  String actionUser;
  DateTime createdDate;
  String rowNumber;

  factory ActivityLogReport.fromJson(Map<String, dynamic> json) => ActivityLogReport(
    residentCode: json["RESIDENT_CODE"],
    fullName: json["FULL_NAME"],
    action: json["ACTION"],
    actionDescription: json["ACTION_DESCRIPTION"],
    otherDetails: json["OTHER_DETAILS"],
    actionUser: json["ACTION_USER"],
    createdDate: json["CREATED_DATE"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "RESIDENT_CODE": residentCode,
    "FULL_NAME": fullName,
    "ACTION": action,
    "ACTION_DESCRIPTION": actionDescription,
    "OTHER_DETAILS": otherDetails,
    "ACTION_USER": actionUser,
    "CREATED_DATE": createdDate,
    "ROW_NUMBER": rowNumber,
  };
}
