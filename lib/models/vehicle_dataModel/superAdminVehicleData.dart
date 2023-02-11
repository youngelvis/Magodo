// To parse this JSON data, do
//
//     final fetchSuperAdminVehicles = fetchSuperAdminVehiclesFromJson(jsonString);

import 'dart:convert';

FetchSuperAdminVehicles fetchSuperAdminVehiclesFromJson(String str) =>
    FetchSuperAdminVehicles.fromJson(json.decode(str));

String fetchSuperAdminVehiclesToJson(FetchSuperAdminVehicles data) =>
    json.encode(data.toJson());

class FetchSuperAdminVehicles {
  FetchSuperAdminVehicles({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<FetchSuperAdminVehicle> data;

  factory FetchSuperAdminVehicles.fromJson(Map<String, dynamic> json) =>
      FetchSuperAdminVehicles(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<FetchSuperAdminVehicle>.from(
            json["data"].map((x) => FetchSuperAdminVehicle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FetchSuperAdminVehicle {
  FetchSuperAdminVehicle({
    required this.residentCode,
    required this.surname,
    required this.firstname,
    required this.fullName,
    required this.msisdn,
    required this.mraZone,
    required this.vehicleNo,
    required this.make,
    required this.model,
    required this.color,
    required this.govAgency,
    required this.registrationNo,
    required this.tstamp,
    required this.guid,
    required this.rfidDate,
    required this.rfidActivationStatus,
    required this.doc,
    required this.rfid,
    required this.approvedBy,
    required this.declineMessage,
    required this.docName,
    required this.receiptNo,
    required this.amount,
    required this.status,
    required this.rowNumber,
  });

  String? residentCode;
  String? surname;
  String? firstname;
  String? fullName;
  String? msisdn;
  String? mraZone;
  String? vehicleNo;
  String? make;
  String? model;
  String? color;
  String? govAgency;
  String? registrationNo;
  String? tstamp;
  String? guid;
  String? rfidDate;
  String? rfidActivationStatus;
  String? doc;
  String? rfid;
  String? approvedBy;
  String? declineMessage;
  String? docName;
  String? receiptNo;
  String? amount;
  String? status;
  String? rowNumber;

  factory FetchSuperAdminVehicle.fromJson(Map<String, dynamic> json) =>
      FetchSuperAdminVehicle(
        residentCode: json["RESIDENT_CODE"],
        surname: json["SURNAME"],
        firstname: json["FIRSTNAME"],
        fullName: json["FULL_NAME"],
        msisdn: json["MSISDN"],
        mraZone: json["MRA_ZONE"],
        vehicleNo: json["VEHICLE_NO"],
        make: json["MAKE"],
        model: json["MODEL"],
        color: json["COLOR"],
        govAgency: json["GOV_AGENCY"],
        registrationNo: json["REGISTRATION_NO"],
        tstamp: json["TSTAMP"],
        guid: json["GUID"],
        rfidDate: json["RFID_DATE"],
        rfidActivationStatus: json["RFID_ACTIVATION_STATUS"],
        doc: json["DOC"],
        rfid: json["RFID"],
        approvedBy: json["APPROVED_BY"],
        declineMessage: json["DECLINE_MESSAGE"],
        docName: json["DOC_NAME"],
        receiptNo: json["RECEIPT_NO"],
        amount: json["AMOUNT"],
        status: json["STATUS"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "RESIDENT_CODE": residentCode,
        "SURNAME": surname,
        "FIRSTNAME": firstname,
        "FULL_NAME": fullName,
        "MSISDN": msisdn,
        "MRA_ZONE": mraZone,
        "VEHICLE_NO": vehicleNo,
        "MAKE": make,
        "MODEL": model,
        "COLOR": color,
        "GOV_AGENCY": govAgency,
        "REGISTRATION_NO": registrationNo,
        "TSTAMP": tstamp,
        "GUID": guid,
        "RFID_DATE": rfidDate,
        "RFID_ACTIVATION_STATUS": rfidActivationStatus,
        "DOC": doc,
        "RFID": rfid,
        "APPROVED_BY": approvedBy,
        "DECLINE_MESSAGE": declineMessage,
        "DOC_NAME": docName,
        "RECEIPT_NO": receiptNo,
        "AMOUNT": amount,
        "STATUS": status,
        "ROW_NUMBER": rowNumber,
      };
}
