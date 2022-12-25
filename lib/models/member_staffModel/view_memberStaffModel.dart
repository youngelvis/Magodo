// To parse this JSON data, do
//
//     final memeberStaffs = memeberStaffsFromJson(jsonString);

import 'dart:convert';

MemberStaffs memeberStaffsFromJson(String str) =>
    MemberStaffs.fromJson(json.decode(str));

String memeberStaffsToJson(MemberStaffs data) => json.encode(data.toJson());

class MemberStaffs {
  MemberStaffs({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
  });

  int recordsTotal;
  int recordsFiltered;
  List<MemberStaff> data;

  factory MemberStaffs.fromJson(Map<String, dynamic> json) => MemberStaffs(
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<MemberStaff>.from(
            json["data"].map((x) => MemberStaff.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MemberStaff {
  MemberStaff({
    required this.residentCode,
    required this.zone,
    required this.staffPasscode,
    required this.residentNo,
    required this.dependantName,
    required this.empdateOrDob,
    required this.dependantPhone,
    required this.relationship,
    required employmentStatus,
    required this.dependantContacts,
    required this.identityStatus,
    required this.dateLastModified,
    required this.rowNumber,
  });

  String? residentCode;
  String? zone;
  String? staffPasscode;
  String? residentNo;
  String? dependantName;
  String? empdateOrDob;
  String? dependantPhone;
  String? relationship;
  String? employmentStatus;
  String? dependantContacts;
  String? identityStatus;
  String? dateLastModified;
  String rowNumber;

  factory MemberStaff.fromJson(Map<String, dynamic> json) => MemberStaff(
        residentCode: json["RESIDENT_CODE"],
        zone: json["ZONE"],
        staffPasscode: json["STAFF_PASSCODE"],
        residentNo: json["RESIDENT_NO"],
        dependantName: json["DEPENDANT_NAME"],
        empdateOrDob: json["EMPDATE_OR_DOB"],
        dependantPhone: json["DEPENDANT_PHONE"],
        relationship: json["RELATIONSHIP"],
        employmentStatus: json["EMPLOYMENT_STATUS"],
        dependantContacts: json["DEPENDANT_CONTACTS"],
        identityStatus: json["IDENTITY_STATUS"],
        dateLastModified: json["DATE_LAST_MODIFIED"],
        rowNumber: json["ROW_NUMBER"],
      );

  Map<String, dynamic> toJson() => {
        "RESIDENT_CODE": residentCode,
        "ZONE": zone,
        "STAFF_PASSCODE": staffPasscode,
        "RESIDENT_NO": residentNo,
        "DEPENDANT_NAME": dependantName,
        "EMPDATE_OR_DOB": empdateOrDob,
        "DEPENDANT_PHONE": dependantPhone,
        "RELATIONSHIP": relationship,
        "EMPLOYMENT_STATUS": employmentStatus,
        "DEPENDANT_CONTACTS": dependantContacts,
        "IDENTITY_STATUS": identityStatus,
        "DATE_LAST_MODIFIED": dateLastModified,
        "ROW_NUMBER": rowNumber,
      };
}
