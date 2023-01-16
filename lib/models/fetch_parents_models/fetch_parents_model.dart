// To parse this JSON data, do
//
//     final fetchParents = fetchParentsFromJson(jsonString);

import 'dart:convert';

FetchParents fetchParentsFromJson(String str) =>
    FetchParents.fromJson(json.decode(str));

String fetchParentsToJson(FetchParents data) => json.encode(data.toJson());

class FetchParents {
  FetchParents({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<FetchParent> data;

  factory FetchParents.fromJson(Map<String, dynamic> json) => FetchParents(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<FetchParent>.from(
            json["data"].map((x) => FetchParent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FetchParent {
  FetchParent({
    required this.guid,
    required this.residentCode,
    required this.residentName,
    required this.businessName,
    required this.parentName,
    required this.parentPasscode,
    required this.parentMobile,
    required this.parentAddress,
    required this.parentEmail,
    required this.zone,
    required this.status,
    required this.validityStarts,
    required this.validityEnds,
    required this.lastModifiedDate,
    required this.dateCreated,
    required this.rowNumber,
  });

  String? guid;
  String? residentCode;
  String? residentName;
  String? businessName;
  String? parentName;
  String? parentPasscode;
  String? parentMobile;
  String? parentAddress;
  String? parentEmail;
  String? zone;
  String? status;
  String? validityStarts;
  String? validityEnds;
  String? lastModifiedDate;
  String? dateCreated;
  String? rowNumber;

  factory FetchParent.fromJson(Map<String, dynamic> json) => FetchParent(
        guid: json["GUID"],
        residentCode: json["RESIDENT_CODE"],
        residentName: json["RESIDENT_NAME"],
        businessName: json["BUSINESS_NAME"],
        parentName: json["PARENT_NAME"],
        parentPasscode: json["PARENT_PASSCODE"],
        parentMobile: json["PARENT_MOBILE"],
        parentAddress: json["PARENT_ADDRESS"],
        parentEmail: json["PARENT_EMAIL"],
        zone: json["ZONE"],
        status: json["STATUS"],
        validityStarts: json["VALIDITY_STARTS"],
        validityEnds: json["VALIDITY_ENDS"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
        dateCreated: json["DATE_CREATED"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "GUID": guid,
        "RESIDENT_CODE": residentCode,
        "RESIDENT_NAME": residentName,
        "BUSINESS_NAME": businessName,
        "PARENT_NAME": parentName,
        "PARENT_PASSCODE": parentPasscode,
        "PARENT_MOBILE": parentMobile,
        "PARENT_ADDRESS": parentAddress,
        "PARENT_EMAIL": parentEmail,
        "ZONE": zone,
        "STATUS": status,
        "VALIDITY_STARTS": validityStarts,
        "VALIDITY_ENDS": validityEnds,
        "LAST_MODIFIED_DATE": lastModifiedDate,
        "DATE_CREATED": dateCreated,
        "ROW_NUMBER": rowNumber,
      };
}
