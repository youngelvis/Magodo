// To parse this JSON data, do
//
//     final eventReports = eventReportsFromJson(jsonString);

import 'dart:convert';

EventReports eventReportsFromJson(String str) => EventReports.fromJson(json.decode(str));

String eventReportsToJson(EventReports data) => json.encode(data.toJson());

class EventReports {
  EventReports({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<EventReport> data;

  factory EventReports.fromJson(Map<String, dynamic> json) => EventReports(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<EventReport>.from(json["data"].map((x) => EventReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EventReport {
  EventReport({
    required this.id,
    required  this.passcode,
    required  this.fullname,
    required   this.eventType,
    required this.population,
    required  this.createdDate,
    required  this.status,
    required  this.rowNumber,
  });

  String? id;
  String? passcode;
  String? fullname;
  String? eventType;
  String? population;
  String? createdDate;
  String? status;
  String? rowNumber;

  factory EventReport.fromJson(Map<String, dynamic> json) => EventReport(
    id: json["ID"],
    passcode: json["PASSCODE"],
    fullname: json["FULLNAME"],
    eventType: json["EVENT_TYPE"],
    population: json["POPULATION"],
    createdDate: json["CREATED_DATE"],
    status: json["STATUS"],
    rowNumber: json["ROW_NUMBER"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "PASSCODE": passcode,
    "FULLNAME": fullname,
    "EVENT_TYPE": eventType,
    "POPULATION": population,
    "CREATED_DATE": createdDate,
    "STATUS": status,
    "ROW_NUMBER": rowNumber,
  };
}
