// To parse this JSON data, do
//
//     final fetchStaffs = fetchStaffsFromJson(jsonString);

import 'dart:convert';

FetchStaffs fetchStaffsFromJson(String str) =>
    FetchStaffs.fromJson(json.decode(str));

String fetchStaffsToJson(FetchStaffs data) => json.encode(data.toJson());

class FetchStaffs {
  FetchStaffs({
    required this.data,
    required this.error,
    required this.message,
    required  this.code,
  });

  List<FetchStaff> data;
  bool error;
  String message;
  int code;

  factory FetchStaffs.fromJson(Map<String, dynamic> json) => FetchStaffs(
        data: List<FetchStaff>.from(
            json["data"].map((x) => FetchStaff.fromJson(x))),
        error: json["error"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
        "message": message,
        "code": code,
      };
}

class FetchStaff {
  FetchStaff({
    required this.guid,
    required this.residentCode,
    required this.residentNo,
    required this.dependantName,
    required this.empdateOrDob,
    required this.dependantPhone,
    required this.zone,
    required this.relationship,
    required this.employmentStatus,
    required this.dependantContacts,
    required this.identityStatus,
    required this.dateLastModified,
    required this.dateCreated,
  });

  String? guid;
  String? residentCode;
  String? residentNo;
  String? dependantName;
  String? empdateOrDob;
  String? dependantPhone;
  String? zone;
  String? relationship;
  String? employmentStatus;
  String? dependantContacts;
  String? identityStatus;
  String? dateLastModified;
  String? dateCreated;

  factory FetchStaff.fromJson(Map<String, dynamic> json) => FetchStaff(
        guid: json["GUID"],
        residentCode: json["RESIDENT_CODE"],
        residentNo: json["RESIDENT_NO"],
        dependantName: json["DEPENDANT_NAME"],
        empdateOrDob: json["EMPDATE_OR_DOB"],
        dependantPhone: json["DEPENDANT_PHONE"],
        zone: json["ZONE"],
        relationship: json["RELATIONSHIP"],
        employmentStatus: json["EMPLOYMENT_STATUS"],
        dependantContacts: json["DEPENDANT_CONTACTS"],
        identityStatus: json["IDENTITY_STATUS"],
        dateLastModified: json["DATE_LAST_MODIFIED"],
        dateCreated: json["DATE_CREATED"],
      );

  Map<String, dynamic> toJson() => {
        "GUID": guid,
        "RESIDENT_CODE": residentCode,
        "RESIDENT_NO": residentNo,
        "DEPENDANT_NAME": dependantName,
        "EMPDATE_OR_DOB": empdateOrDob,
        "DEPENDANT_PHONE": dependantPhone,
        "ZONE": zone,
        "RELATIONSHIP": relationship,
        "EMPLOYMENT_STATUS": employmentStatus,
        "DEPENDANT_CONTACTS": dependantContacts,
        "IDENTITY_STATUS": identityStatus,
        "DATE_LAST_MODIFIED": dateLastModified,
        "DATE_CREATED": dateCreated,
      };
}
