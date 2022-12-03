// To parse this JSON data, do
//
//     final staffs = staffsFromJson(jsonString);

import 'dart:convert';

Staffs staffsFromJson(String str) => Staffs.fromJson(json.decode(str));

String staffsToJson(Staffs data) => json.encode(data.toJson());

class Staffs {
  Staffs({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<Staff> data;

  factory Staffs.fromJson(Map<String, dynamic> json) => Staffs(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Staff>.from(json["data"].map((x) => Staff.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Staff {
  Staff({
    required this.guid,
    required this.dependantName,
    required this.empdateOrDob,
    required this.dependantPhone,
    required this.relationship,
    required this.identityStatus,
    required this.validityStarts,
    required this.validityEnds,
    required this.dependantContacts,
    required  this.dateCreated,
    required this.zone,
    required this.staffPasscode,
    required this.rowNumber,
  });

  String? guid;
  String? dependantName;
  String? empdateOrDob;
  String? dependantPhone;
  String? relationship;
  String? identityStatus;
  String? validityStarts;
  String? validityEnds;
  String? dependantContacts;
  String? dateCreated;
  String? zone;
  String? staffPasscode;
  String? rowNumber;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    guid: json["GUID"],
    dependantName: json["DEPENDANT_NAME"],
    empdateOrDob: json["EMPDATE_OR_DOB"],
    dependantPhone: json["DEPENDANT_PHONE"],
    relationship: json["RELATIONSHIP"],
    identityStatus: json["IDENTITY_STATUS"],
    validityStarts: json["VALIDITY_STARTS"],
    validityEnds: json["VALIDITY_ENDS"],
    dependantContacts: json["DEPENDANT_CONTACTS"],
    dateCreated: json["DATE_CREATED"],
    zone: json["ZONE"],
    staffPasscode: json["STAFF_PASSCODE"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "GUID": guid,
    "DEPENDANT_NAME": dependantName,
    "EMPDATE_OR_DOB": empdateOrDob,
    "DEPENDANT_PHONE": dependantPhone,
    "RELATIONSHIP": relationship,
    "IDENTITY_STATUS": identityStatus,
    "VALIDITY_STARTS": validityStarts,
    "VALIDITY_ENDS": validityEnds,
    "DEPENDANT_CONTACTS": dependantContacts,
    "DATE_CREATED": dateCreated,
    "ZONE": zone,
    "STAFF_PASSCODE": staffPasscode,
    "ROW_NUMBER": rowNumber,
  };
}
