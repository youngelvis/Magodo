// To parse this JSON data, do
//
//     final visitors = visitorsFromJson(jsonString);

import 'dart:convert';

Visitors visitorsFromJson(String str) => Visitors.fromJson(json.decode(str));

String visitorsToJson(Visitors data) => json.encode(data.toJson());

class Visitors {
  Visitors({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<Visitor> data;

  factory Visitors.fromJson(Map<String, dynamic> json) => Visitors(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Visitor>.from(json["data"].map((x) => Visitor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Visitor {
  Visitor({
    required this.residentMsisdn,
    required this.residentCode,
    required this.residentName,
    required this.residentAddress,
    required this.visitorMsisdn,
    required this.visitorName,
    required this.createdDate,
    required this.doNotHonorStatus,
    required this.rowNumber,
  });

  String residentMsisdn;
  String residentCode;
  String residentName;
  String residentAddress;
  String visitorMsisdn;
  String visitorName;
  String createdDate;
  String doNotHonorStatus;
  String rowNumber;

  factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
    residentMsisdn: json["RESIDENT_MSISDN"],
    residentCode: json["RESIDENT_CODE"],
    residentName: json["RESIDENT_NAME"],
    residentAddress: json["RESIDENT_ADDRESS"],
    visitorMsisdn: json["VISITOR_MSISDN"],
    visitorName: json["VISITOR_NAME"],
    createdDate: json["CREATED_DATE"],
    doNotHonorStatus: json["DO_NOT_HONOR_STATUS"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "RESIDENT_MSISDN": residentMsisdn,
    "RESIDENT_CODE": residentCode,
    "RESIDENT_NAME": residentName,
    "RESIDENT_ADDRESS": residentAddress,
    "VISITOR_MSISDN": visitorMsisdn,
    "VISITOR_NAME": visitorName,
    "CREATED_DATE": createdDate,
    "DO_NOT_HONOR_STATUS": doNotHonorStatus,
    "ROW_NUMBER": rowNumber,
  };
}
