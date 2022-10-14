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

  String guid;
  String dependantName;
  DateTime empdateOrDob;
  String dependantPhone;
  String relationship;
  String identityStatus;
  DateTime validityStarts;
  DateTime validityEnds;
  String dependantContacts;
  String dateCreated;
  String zone;
  String staffPasscode;
  String rowNumber;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    guid: json["GUID"],
    dependantName: json["DEPENDANT_NAME"],
    empdateOrDob: DateTime.parse(json["EMPDATE_OR_DOB"]),
    dependantPhone: json["DEPENDANT_PHONE"],
    relationship: json["RELATIONSHIP"],
    identityStatus: json["IDENTITY_STATUS"],
    validityStarts: DateTime.parse(json["VALIDITY_STARTS"]),
    validityEnds: DateTime.parse(json["VALIDITY_ENDS"]),
    dependantContacts: json["DEPENDANT_CONTACTS"],
    dateCreated: json["DATE_CREATED"],
    zone: json["ZONE"],
    staffPasscode: json["STAFF_PASSCODE"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "GUID": guid,
    "DEPENDANT_NAME": dependantName,
    "EMPDATE_OR_DOB": "${empdateOrDob.year.toString().padLeft(4, '0')}-${empdateOrDob.month.toString().padLeft(2, '0')}-${empdateOrDob.day.toString().padLeft(2, '0')}",
    "DEPENDANT_PHONE": dependantPhone,
    "RELATIONSHIP": relationship,
    "IDENTITY_STATUS": identityStatus,
    "VALIDITY_STARTS": "${validityStarts.year.toString().padLeft(4, '0')}-${validityStarts.month.toString().padLeft(2, '0')}-${validityStarts.day.toString().padLeft(2, '0')}",
    "VALIDITY_ENDS": "${validityEnds.year.toString().padLeft(4, '0')}-${validityEnds.month.toString().padLeft(2, '0')}-${validityEnds.day.toString().padLeft(2, '0')}",
    "DEPENDANT_CONTACTS": dependantContacts,
    "DATE_CREATED": dateCreated,
    "ZONE": zone,
    "STAFF_PASSCODE": staffPasscode,
    "ROW_NUMBER": rowNumber,
  };
}
