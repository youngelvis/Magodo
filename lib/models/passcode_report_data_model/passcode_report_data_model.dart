// To parse this JSON data, do
//
//     final passcodeReports = passcodeReportsFromJson(jsonString);

import 'dart:convert';

PasscodeReports passcodeReportsFromJson(String str) => PasscodeReports.fromJson(json.decode(str));

String passcodeReportsToJson(PasscodeReports data) => json.encode(data.toJson());

class PasscodeReports {
  PasscodeReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<PasscodeReport> data;

  factory PasscodeReports.fromJson(Map<String, dynamic> json) => PasscodeReports(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<PasscodeReport>.from(json["data"].map((x) => PasscodeReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PasscodeReport {
  PasscodeReport({
    required this.passcode,
    required this.createdDate,
    required this.visitorName,
    required this.visitorMsisdn,
    required this.residentMsisdn,
    required this.residentCode,
    required this.residentName,
    required  this.residentAddress,
    required this.arivalDate,
    required this.timeFrom,
    required this.timeTo,
    required this.doNotHonorStatus,
    required this.rowNumber,
  });

  String? passcode;
  String? createdDate;
  String? visitorName;
  String? visitorMsisdn;
  String? residentMsisdn;
  String? residentCode;
  String? residentName;
  String? residentAddress;
  String? arivalDate;
  String? timeFrom;
  String? timeTo;
  String? doNotHonorStatus;
  String? rowNumber;

  factory PasscodeReport.fromJson(Map<String, dynamic> json) => PasscodeReport(
    passcode: json["PASSCODE"],
    createdDate: json["CREATED_DATE"],
    visitorName: json["VISITOR_NAME"],
    visitorMsisdn: json["VISITOR_MSISDN"],
    residentMsisdn: json["RESIDENT_MSISDN"],
    residentCode: json["RESIDENT_CODE"],
    residentName: json["RESIDENT_NAME"],
    residentAddress: json["RESIDENT_ADDRESS"],
    arivalDate: json["ARIVAL_DATE"],
    timeFrom: json["TIME_FROM"],
    timeTo: json["TIME_TO"],
    doNotHonorStatus: json["DO_NOT_HONOR_STATUS"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "PASSCODE": passcode,
    "CREATED_DATE": createdDate,
    "VISITOR_NAME": visitorName,
    "VISITOR_MSISDN": visitorMsisdn,
    "RESIDENT_MSISDN": residentMsisdn,
    "RESIDENT_CODE": residentCode,
    "RESIDENT_NAME": residentName,
    "RESIDENT_ADDRESS": residentAddress,
    "ARIVAL_DATE": arivalDate,
    "TIME_FROM": timeFrom,
    "TIME_TO": timeTo,
    "DO_NOT_HONOR_STATUS": doNotHonorStatus,
    "ROW_NUMBER": rowNumber,
  };
}
