// To parse this JSON data, do
//
//     final movementRegisterReports = movementRegisterReportsFromJson(jsonString);

import 'dart:convert';

MovementRegisterReports movementRegisterReportsFromJson(String str) =>
    MovementRegisterReports.fromJson(json.decode(str));

String movementRegisterReportsToJson(MovementRegisterReports data) =>
    json.encode(data.toJson());

class MovementRegisterReports {
  MovementRegisterReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<MovementRegisterReport> data;

  factory MovementRegisterReports.fromJson(Map<String, dynamic> json) =>
      MovementRegisterReports(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<MovementRegisterReport>.from(
            json["data"].map((x) => MovementRegisterReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MovementRegisterReport {
  MovementRegisterReport({
    required this.passcode,
    required this.visitorMsisdn,
    required this.residentCode,
    required this.residentMsisdn,
    required this.residentFullName,
    required this.timeIn,
    required this.timeOut,
    required this.createdDate,
    required this.rowNumber,
  });

  String? passcode;
  String? visitorMsisdn;
  String? residentCode;
  String? residentMsisdn;
  String? residentFullName;
  String? timeIn;
  String? timeOut;
  String? createdDate;
  String? rowNumber;

  factory MovementRegisterReport.fromJson(Map<String, dynamic> json) =>
      MovementRegisterReport(
        passcode: json["PASSCODE"],
        visitorMsisdn: json["VISITOR_MSISDN"],
        residentCode: json["RESIDENT_CODE"],
        residentMsisdn: json["RESIDENT_MSISDN"],
        residentFullName: json["RESIDENT_FULL_NAME"],
        timeIn: json["TIME_IN"],
        timeOut: json["TIME_OUT"],
        createdDate: json["CREATED_DATE"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "PASSCODE": passcode,
        "VISITOR_MSISDN": visitorMsisdn,
        "RESIDENT_CODE": residentCode,
        "RESIDENT_MSISDN": residentMsisdn,
        "RESIDENT_FULL_NAME": residentFullName,
        "TIME_IN": timeIn,
        "TIME_OUT": timeOut,
        "CREATED_DATE": createdDate,
        "ROW_NUMBER": rowNumber,
      };
}
