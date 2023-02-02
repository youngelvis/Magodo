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
    required this.code,
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
    required this.dependantName,
    required this.staffPasscode,
  });

  String? guid;
  String? dependantName;

  String? staffPasscode;

  factory FetchStaff.fromJson(Map<String, dynamic> json) => FetchStaff(
        guid: json["GUID"],
        dependantName: json["DEPENDANT_NAME"],
        staffPasscode: json["STAFF_PASSCODE"],
      );

  Map<String, dynamic> toJson() => {
        "GUID": guid,
        "DEPENDANT_NAME": dependantName,
        "STAFF_PASSCODE": staffPasscode,
      };
}
