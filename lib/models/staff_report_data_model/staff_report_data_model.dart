// To parse this JSON data, do
//
//     final staffReports = staffReportsFromJson(jsonString);

import 'dart:convert';

StaffReports staffReportsFromJson(String str) => StaffReports.fromJson(json.decode(str));

String staffReportsToJson(StaffReports data) => json.encode(data.toJson());

class StaffReports {
  StaffReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<StaffReport> data;

  factory StaffReports.fromJson(Map<String, dynamic> json) => StaffReports(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<StaffReport>.from(json["data"].map((x) => StaffReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class StaffReport {
  StaffReport({
    required this.guid,
    required this.residentCode,
    required this.residentNo,
    required this.dependantName,
    required this.empdateOrDob,
    required this.dependantPhone,
    required this.relationship,
    required this.employmentStatus,
    required this.dependantContacts,
    required this.dateLastModified,
    required this.dateCreated,
    required this.identityStatus,
    required this.zone,
    required this.staffPasscode,
    required this.validityStarts,
    required this.validityEnds,
    required this.flagg,
    required this.rowNumber,
  });

  String? guid;
  String? residentCode;
  String? residentNo;
  String? dependantName;
  String? empdateOrDob;
  String? dependantPhone;
  String? relationship;
  String? employmentStatus;
  String? dependantContacts;
  String? dateLastModified;
  String? dateCreated;
  String? identityStatus;
  String? zone;
  String? staffPasscode;
  String? validityStarts;
  String? validityEnds;
  String? flagg;
  String? rowNumber;

  factory StaffReport.fromJson(Map<String, dynamic> json) => StaffReport(
    guid: json["GUID"],
    residentCode: json["RESIDENT_CODE"],
    residentNo: json["RESIDENT_NO"],
    dependantName: json["DEPENDANT_NAME"],
    empdateOrDob: json["EMPDATE_OR_DOB"],
    dependantPhone: json["DEPENDANT_PHONE"],
    relationship: json["RELATIONSHIP"],
    employmentStatus: json["EMPLOYMENT_STATUS"],
    dependantContacts: json["DEPENDANT_CONTACTS"],
    dateLastModified: json["DATE_LAST_MODIFIED"],
    dateCreated: json["DATE_CREATED"],
    identityStatus: json["IDENTITY_STATUS"],
    zone: json["ZONE"],
    staffPasscode: json["STAFF_PASSCODE"],
    validityStarts: json["VALIDITY_STARTS"],
    validityEnds: json["VALIDITY_ENDS"],
    flagg: json["FLAGG"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "GUID": guid,
    "RESIDENT_CODE": residentCode,
    "RESIDENT_NO": residentNo,
    "DEPENDANT_NAME": dependantName,
    "EMPDATE_OR_DOB": empdateOrDob,
    "DEPENDANT_PHONE": dependantPhone,
    "RELATIONSHIP": relationship,
    "EMPLOYMENT_STATUS": employmentStatus,
    "DEPENDANT_CONTACTS": dependantContacts,
    "DATE_LAST_MODIFIED": dateLastModified,
    "DATE_CREATED": dateCreated,
    "IDENTITY_STATUS": identityStatus,
    "ZONE": zone,
    "STAFF_PASSCODE": staffPasscode,
    "VALIDITY_STARTS": validityStarts,
    "VALIDITY_ENDS": validityEnds,
    "FLAGG": flagg,
    "ROW_NUMBER": rowNumber,
  };
}
