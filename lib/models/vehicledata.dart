// To parse this JSON data, do
//
//     final vehicles = vehiclesFromJson(jsonString);

import 'dart:convert';

Vehicles vehiclesFromJson(String str) => Vehicles.fromJson(json.decode(str));

String vehiclesToJson(Vehicles data) => json.encode(data.toJson());

class Vehicles {
  Vehicles({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<Vehicle> data;

  factory Vehicles.fromJson(Map<String, dynamic> json) => Vehicles(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<Vehicle>.from(json["data"].map((x) => Vehicle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Vehicle {
  Vehicle({
    required this.guid,
    required this.declineMessage,
    required this.rfid,
    required this.vehicleNo,
    required this.make,
    required this.model,
    required this.color,
    required this.govAgency,
    required this.docName,
    required this.registrationNo,
    required this.doc,
    required this.tstamp,
    required this.receiptNo,
    required this.amount,
    required this.status,
    required this.rowNumber,
  });

  String? guid;
  String? declineMessage;
  String? rfid;
  String? vehicleNo;
  String? make;
  String? model;
  String? color;
  String? govAgency;
  String? docName;
  String? registrationNo;
  String? doc;
  String? tstamp;
  String? receiptNo;
  String? amount;
  String? status;
  String? rowNumber;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        guid: json["GUID"],
        declineMessage: json["DECLINE_MESSAGE"],
        rfid: json["RFID"],
        vehicleNo: json["VEHICLE_NO"],
        make: json["MAKE"],
        model: json["MODEL"],
        color: json["COLOR"],
        govAgency: json["GOV_AGENCY"],
        docName: json["DOC_NAME"],
        registrationNo: json["REGISTRATION_NO"],
        doc: json["DOC"],
        tstamp: json["TSTAMP"],
        receiptNo: json["RECEIPT_NO"],
        amount: json["AMOUNT"],
        status: json["STATUS"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "GUID": guid,
        "DECLINE_MESSAGE": declineMessage,
        "RFID": rfid,
        "VEHICLE_NO": vehicleNo,
        "MAKE": make,
        "MODEL": model,
        "COLOR": color,
        "GOV_AGENCY": govAgency,
        "DOC_NAME": docName,
        "REGISTRATION_NO": registrationNo,
        "DOC": doc,
        "TSTAMP": tstamp,
        "RECEIPT_NO": receiptNo,
        "AMOUNT": amount,
        "STATUS": status,
        "ROW_NUMBER": rowNumber,
      };
}
