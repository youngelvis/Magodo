// To parse this JSON data, do
//
//     final commercialEventRequests = commercialEventRequestsFromJson(jsonString);

import 'dart:convert';

CommercialEventRequests commercialEventRequestsFromJson(String str) =>
    CommercialEventRequests.fromJson(json.decode(str));

String commercialEventRequestsToJson(CommercialEventRequests data) =>
    json.encode(data.toJson());

class CommercialEventRequests {
  CommercialEventRequests({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<CommercialEventRequest> data;

  factory CommercialEventRequests.fromJson(Map<String, dynamic> json) =>
      CommercialEventRequests(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<CommercialEventRequest>.from(
            json["data"].map((x) => CommercialEventRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CommercialEventRequest {
  CommercialEventRequest({
    required this.residentMsisdn,
    required this.residentCode,
    required this.residentName,
    required this.residentAddress,
    required this.visitorMsisdn,
    required this.visitorName,
    required this.passcode,
    required this.createdDate,
    required this.eventScheduledDate,
    required this.rowNumber,
  });

  String? residentMsisdn;
  String? residentCode;
  String? residentName;
  String? residentAddress;
  String? visitorMsisdn;
  String? visitorName;
  String? passcode;
  String? createdDate;
  String? eventScheduledDate;
  String? rowNumber;

  factory CommercialEventRequest.fromJson(Map<String, dynamic> json) =>
      CommercialEventRequest(
        residentMsisdn: json["RESIDENT_MSISDN"],
        residentCode: json["RESIDENT_CODE"],
        residentName: json["RESIDENT_NAME"],
        residentAddress: json["RESIDENT_ADDRESS"],
        visitorMsisdn: json["VISITOR_MSISDN"],
        visitorName: json["VISITOR_NAME"],
        passcode: json["PASSCODE"],
        createdDate: json["CREATED_DATE"],
        eventScheduledDate: json["EVENT_SCHEDULED_DATE"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "RESIDENT_MSISDN": residentMsisdn,
        "RESIDENT_CODE": residentCode,
        "RESIDENT_NAME": residentName,
        "RESIDENT_ADDRESS": residentAddress,
        "VISITOR_MSISDN": visitorMsisdn,
        "VISITOR_NAME": visitorName,
        "PASSCODE": passcode,
        "CREATED_DATE": createdDate,
        "EVENT_SCHEDULED_DATE": eventScheduledDate,
        "ROW_NUMBER": rowNumber,
      };
}
