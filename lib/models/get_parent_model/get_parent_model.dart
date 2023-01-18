// To parse this JSON data, do
//
//     final fetchParents = fetchParentsFromJson(jsonString);

import 'dart:convert';

FetchParents fetchParentsFromJson(String str) => FetchParents.fromJson(json.decode(str));

String fetchParentsToJson(FetchParents data) => json.encode(data.toJson());

class FetchParents {
  FetchParents({
    required this.data,
    required  this.error,
    required this.message,
    required this.code,
  });

  List<FetchParent> data;
  bool error;
  String message;
  int code;

  factory FetchParents.fromJson(Map<String, dynamic> json) => FetchParents(
    data: List<FetchParent>.from(json["data"].map((x) => FetchParent.fromJson(x))),
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

class FetchParent {
  FetchParent({

    required this.parentPasscode,
    required this.parentName,
  });

  String? parentPasscode;
  String? parentName;

  factory FetchParent.fromJson(Map<String, dynamic> json) => FetchParent(
    parentPasscode: json["PARENT_PASSCODE"],
    parentName: json["PARENT_NAME"],
  );

  Map<String, dynamic> toJson() => {
    "PARENT_PASSCODE": parentPasscode,
    "PARENT_NAME": parentName,
  };
}
