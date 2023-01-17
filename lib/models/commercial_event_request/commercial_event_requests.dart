// To parse this JSON data, do
//
//     final commercialEventRequests = commercialEventRequestsFromJson(jsonString);

import 'dart:convert';

CommercialEventRequests commercialEventRequestsFromJson(String str) => CommercialEventRequests.fromJson(json.decode(str));

String commercialEventRequestsToJson(CommercialEventRequests data) => json.encode(data.toJson());

class CommercialEventRequests {
  CommercialEventRequests({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<CommercialEventRequest> data;

  factory CommercialEventRequests.fromJson(Map<String, dynamic> json) => CommercialEventRequests(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<CommercialEventRequest>.from(json["data"].map((x) => CommercialEventRequest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CommercialEventRequest {
  CommercialEventRequest({
    required this.id,
    required this.email,
    required this.passcode,
    required  this.msisdn,
    required this.population,
    required this.eventType,
    required this.fullname,
    required  this.eventScheduledDate,
    required  this.createdDate,
    required  this.status,
    required this.rowNumber,
  });

  String? id;
  String? email;
  String? passcode;
  String? msisdn;
  String? population;
  String? eventType;
  String? fullname;
  String? eventScheduledDate;
  String? createdDate;
  String? status;
  String? rowNumber;

  factory CommercialEventRequest.fromJson(Map<String, dynamic> json) => CommercialEventRequest(
    id: json["ID"],
    email: json["EMAIL"],
    passcode: json["PASSCODE"],
    msisdn: json["MSISDN"],
    population: json["POPULATION"],
    eventType: json["EVENT_TYPE"],
    fullname: json["FULLNAME"],
    eventScheduledDate: json["EVENT_SCHEDULED_DATE"],
    createdDate: json["CREATED_DATE"],
    status: json["STATUS"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "EMAIL": email,
    "PASSCODE": passcode,
    "MSISDN": msisdn,
    "POPULATION": population,
    "EVENT_TYPE": eventType,
    "FULLNAME": fullname,
    "EVENT_SCHEDULED_DATE": eventScheduledDate,
    "CREATED_DATE": createdDate,
    "STATUS": status,
    "ROW_NUMBER": rowNumber,
  };
}
