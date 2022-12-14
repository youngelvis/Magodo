import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/models/add_staff_data_model/staffdata.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:path/path.dart';

class Services {
  // 1
  Future<dynamic> login(residentCode, password) async {
    var data = {"resident_code": residentCode, "password": password};

    var res = await CallApi().postData(data, 'login');
    var body = jsonDecode(res.body);
    return body;
  }

//2
  register(password, surname, firstname, email, zone, address, residentType,
      confirmPassword, residentPhone) async {
    var data = {
      "resident_phone": residentPhone,
      "surname": surname,
      "firstname": firstname,
      "email": email,
      "zone": zone,
      "password": password,
      "confirm_password": confirmPassword,
      "address": address,
      "resident_type": residentType
    };

    var res = await CallApi().postData(data, 'createResident');
    var body = jsonDecode(res.body);
    return body;
  }

//3
  registerCommercial(
      password,
      surname,
      firstname,
      email,
      zone,
      address,
      residentType,
      confirmPassword,
      residentPhone,
      businessName,
      staffNumber,
      businessEmail,
      category,
      streetAddress,
      mobileNumber) async {
    var data = {
      "resident_phone": residentPhone,
      "surname": surname,
      "firstname": firstname,
      "email": email,
      "zone": zone,
      "password": password,
      "confirm_password": confirmPassword,
      "address": address,
      "resident_type": residentType,
      "business_name": businessName,
      "business_email": businessEmail,
      "staff_numbers": staffNumber,
      "category": category,
      "street_address": streetAddress,
      "mobile_number": mobileNumber
    };

    var res = await CallApi().postData(data, 'createCommercial');
    var body = jsonDecode(res.body);
    return body;
  }

//4
  Future<dynamic> viewSentPasscodeReport(
    page,
    residentCode,
    search,
  ) async {
    var data = {
      "page": page,
      "limit": "10",
      "resident_code": residentCode,
      "search": search.toString()
    };
    var res = await CallApi().postData(data, 'viewSentPasscode');

    return res.body;
  }

  //5
  sendSMSPasscode(sendMsisdn, message, residentCode) async {
    var data = {
      "send_msisdn": sendMsisdn,
      "message": message,
      "resident_code": residentCode
    };
    var res = await CallApi().postData(data, 'sendSMSPasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //6
  getFuturePasscode(sendMsisdn, visitorName, residentCode, numberVisitor, email,
      arrivalDate, timeFrom, timeTo) async {
    var data = {
      "msisdn": sendMsisdn,
      "visitor_name": visitorName ?? '',
      "resident_code": residentCode,
      "number_visitor": numberVisitor,
      "email": email,
      "arival_date": arrivalDate,
      "time_from": timeFrom,
      "time_to": timeTo,
    };
    var res = await CallApi().postData(data, 'getFuturePasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //7
  getPasscode(
    sendMsisdn,
    visitorName,
    residentCode,
    numberVisitor,
    email,
  ) async {
    var data = {
      "msisdn": sendMsisdn,
      "visitor_name": visitorName,
      "resident_code": residentCode,
      "number_visitor": numberVisitor,
      "email": email ?? "",
    };
    var res = await CallApi().postData(data, 'getPasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //8
  updateResidentProfile(
      residentCode,
      fullName,
      residentPhone,
      email,
      userGroup,
      status,
      address,
      residentType,
      validityStartsDate,
      validityEndsDate) async {
    var data = {
      "resident_code": residentCode,
      "full_name": fullName,
      "resident_phone": residentPhone,
      "email": email,
      "user_group": userGroup,
      "status": status,
      "address": address,
      "resident_type": residentType,
      "validity_starts_date": validityStartsDate,
      "Validity_ends_date": validityEndsDate
    };

    var res = await CallApi().postData(data, 'updateResidentProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  //9
  updateCommercialProfile(
      residentPhone,
      fullName,
      residentCode,
      email,
      userGroup,
      status,
      residentType,
      address,
      validityStartsDate,
      validityEndsDate) async {
    var data = {
      "resident_code": residentCode,
      "resident_phone": residentPhone,
      "full_name": fullName,
      "email": email,
      "user_group": userGroup,
      "status": status,
      "resident_type": residentType,
      "address": address,
      "validity_starts_date": validityStartsDate,
      "Validity_ends_date": validityEndsDate
    };

    var res = await CallApi().postData(data, 'updateCommercialProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  //10
  addStaff(residentPhone, fullName, residentCode, dependantPhone, relationship,
      employmentStatus, contactDetail, employStart) async {
    var data = {
      "resident_reg_code": residentCode,
      "resident_phone": residentPhone,
      "full_name": fullName,
      "employ_starts": employStart,
      "dependant_phone": dependantPhone ?? '',
      "relationship": relationship,
      "employment_status": employmentStatus,
      "contact_detail": contactDetail,
    };

    var res = await CallApi().postData(data, 'addStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //11
  addFamilyMember(residentCode, residentPhone, fullName, email, password,
      confirmPassword) async {
    var data = {
      "resident_code": residentCode,
      "resident_phone": residentPhone,
      "full_name": fullName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
    };

    var res = await CallApi().postData(data, 'addFamilyMember');
    var body = jsonDecode(res.body);
    return body;
  }

  //11
  doNotHonor(
    passcode,
    isChecked,
  ) async {
    var data = {
      "passcode": passcode,
      "isChecked": isChecked,
    };

    var res = await CallApi().putData(data, 'doNotHonor');
    var body = jsonDecode(res.body);
    return body;
  }

  //12
  forgetPasswordGenerateToken(residentCode, email, mobileNumber) async {
    var data = {
      "resident_reg_code": residentCode,
      "email": email,
      "resident_phone": mobileNumber
    };

    var res = await CallApi().postData(data, 'forgetPasswordGenerateToken');
    var body = jsonDecode(res.body);
    return body;
  }

  //13
  resetPassword(token, newPassword, confirmPassword) async {
    var data = {
      "token": token,
      "new_password": newPassword,
      "confirm_password": confirmPassword
    };

    var res = await CallApi().postData(data, 'resetPassword');
    var body = jsonDecode(res.body);
    return body;
  }

  //15
  getAddFamilyReport(residentCode, page, limit, search) async {
    var data = {
      "resident_code": residentCode,
      "page": page,
      "limit": "10",
      "search": search.toString()
    };

    var res = await CallApi().postData(data, 'addFamilyReport');

    return res.body;
  }

  //16
  getAddStaffReport(residentCode, page, limit, search) async {
    var data = {
      "resident_code": residentCode,
      "page": page,
      "limit": "10",
      "search": search.toString()
    };

    var res = await CallApi().postData(data, 'addStaffReport');
    return res.body;
  }

  //17
  getMemberVehicleReport(residentCode, page, limit, search) async {
    var data = {
      "resident_code": residentCode,
      "page": page,
      "limit": "10",
      "search": search.toString()
    };

    var res = await CallApi().postData(data, 'memberVehicleReport');
    return res.body;
  }

  //18
  getDeleteStaff(guidId) async {
    var data = {
      "guid_id": guidId,
    };

    var res = await CallApi().deleteData(data, 'deleteStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //19
  getDeleteFamilyMember(residentCode) async {
    var data = {
      "resident_code": residentCode,
    };

    var res = await CallApi().deleteData(data, 'deleteFamilyMember');
    var body = jsonDecode(res.body);
    return body;
  }

  //22
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.first.path;
    return path as String;
  }

  //23
  Future baseName(file) async {
    final fileName = basename(file);
    return fileName;
  }

  //24
  sendWhatsappPasscode(sendMsisdn, message, residentCode) async {
    var data = {
      'send_msisdn': sendMsisdn,
      "message": message,
      "resident_code": residentCode
    };
    var res = await CallApi().postData(data, 'sendWhatsappPasscode');
    var body = jsonDecode(res.body);
    return body;
  }

//25
  updateStaff(dependantName, dependentPhone, employmentStatus, empdateOrDob,
      contactDetail, relationship, mainData) async {
    Staff staff = mainData;

    var data = {
      "guid_id": staff.guid,
      "dependant_name": dependantName,
      "dependant_phone": dependentPhone,
      "employment_status": employmentStatus ?? staff.employmentStatus,
      "empdate_or_dob": empdateOrDob,
      "relationship": relationship ?? staff.relationship,
      "contact_detail": contactDetail
    };
    var res = await CallApi().putData(data, 'updateStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //26
  updateFamily(residentCode, fullName, mobileNumber, email) async {
    var data = {
      "resident_code": residentCode,
      "full_name": fullName,
      "dependant_phone": mobileNumber,
      "email": email
    };

    var res = await CallApi().putData(data, 'updateFamilyMember');
    var body = jsonDecode(res.body);
    return body;
  }

  //27
  changePassword(
      residentCode, currentPassword, newPassword, newConfirmPassword) async {
    var data = {
      "resident_code": residentCode,
      "current_password": currentPassword,
      "newPassword": newPassword,
      "confirm_password": newConfirmPassword
    };

    var res = await CallApi().putData(data, 'changePassword');
    var body = jsonDecode(res.body);
    return body;
  }

  //28
  addNewAdministrativeUser(
      residentCode,
      residentPhone,
      surname,
      firstName,
      email,
      userGroup,
      status,
      address,
      zone,
      validityStart,
      validityEnd,
      password,
      confirmPassword) async {
    var data = {
      "resident_reg_code": residentCode,
      "resident_phone": residentPhone,
      "surname": surname,
      "firstname": firstName,
      "email": email,
      "user_group": userGroup,
      "status": status,
      "address": address,
      "zone": zone,
      "validity_start_date": validityStart,
      "validity_end_date": validityEnd,
      "password": password,
      "confirm_password": confirmPassword,
      "action_user": "sadmin"
    };
    var res = await CallApi().postData(data, 'createAdmin');
    var body = jsonDecode(res.body);
    return body;
  }

  //29

  updateProfile(firstName, surname, residentPhone, email, residentType, address,
      residentData) async {
    ResidentModel? residentModel = residentData;
    var data = {
      "resident_code": residentModel!.resident_code,
      "firstname": firstName,
      "surname": surname,
      "resident_phone": residentPhone,
      "email": email,
      "user_group": residentModel.usr_group,
      "status": residentModel.user_status,
      "mra_zone": residentModel.zone,
      "resident_type": residentType,
      "address": address,
      "validity_starts_date": residentModel.validity_starts,
      "validity_ends_date": residentModel.validity_ends
    };
    var res = await CallApi().postData(data, 'updateResidentProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  // 30
  viewMembersReportForSAdmin(page) async {
    var data = {
      "page": page,
      "limit": "10",
      "user_group": "sadmin",
    };
    var res = await CallApi().postData(data, 'membersReport');
    return res.body;
  }

  //31

  viewMemberStaffReport(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'dependantsReport');
    return res.body;
  }

  // 32
  viewMovementRegister(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'movementRegisterReport');
    return res.body;
  }

  // 33

  viewActivityLogReport(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'activityLogReport');
    return res.body;
  }

//34

  changeResident(residentCode) async {
    var data = {"resident_reg_code": residentCode};
    var res = await CallApi().postData(data, 'changeResident');
    var body = jsonDecode(res.body);
    return body;
  }

  //35

  updateMember(residentCode, residentPhone, firstname, surname, email,
      userGroup, status, address, zone, validityStart, validityEnd) async {
    final data = {
      "resident_reg_code": residentCode,
      "resident_phone": residentPhone,
      "firstname": firstname,
      "surname": surname,
      "email": email,
      "user_group": userGroup,
      "status": status,
      "address": address,
      "zone": zone,
      "validity_start_date": validityStart,
      "validity_end_date": validityEnd,
      "action_user": "Sadmin"
    };
    print(data);
    var res = await CallApi().putData(data, 'updateMember');
    var body = jsonDecode(res.body);
    return body;
  }

  //36

  requestEvent(
      residentCode, population, scheduleDate, scheduleTime, eventType) async {
    final data = {
      "resident_code": residentCode,
      "population": population,
      "schedule_date": scheduleDate,
      "schedule_time": scheduleTime,
      "event_type": eventType
    };
    var res = await CallApi().postData(data, 'eventRequest');
    var body = jsonDecode(res.body);
    return body;
  }

  //37

  viewEventRequest(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'eventRequestReport');
    return res.body;
  }

  //38

  viewResidentReport(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'validateResidentReport');
    return res.body;
  }

  //39

  viewStaffReport(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'validateStaffReport');
    return res.body;
  }

  //40

  viewParentReport(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'validateParentReport');
    return res.body;
  }

  //41
  viewPasscode(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'passcodeHistory');
    return res.body;
  }

  //42
  validatePasscode(passcode, userGroup) async {
    var data = {
      "passcode": passcode,
      "action_user": "security",
      "user_group": userGroup
    };
    var res = await CallApi().postData(data, 'validatePasscode');
    var body = jsonDecode(res.body);
    return body;
  }

//43
  validateResident(residentCode) async {
    var data = {
      "resident_code": residentCode,
    };
    var res = await CallApi().postData(data, 'validateResident');
    var body = jsonDecode(res.body);
    return body;
  }

  //44
  validateStaff(passcode) async {
    var data = {
      "staff_passcode": passcode,
    };
    var res = await CallApi().postData(data, 'validateStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //45
  validateParent(passcode) async {
    var data = {
      "parent_passcode": passcode,
    };
    var res = await CallApi().postData(data, 'validateParent');
    var body = jsonDecode(res.body);
    return body;
  }

  //46
  guestSignOut(passcode, userGroup) async {
    var data = {
      "passcode": passcode,
      "action_user": "security",
      "user_group": userGroup
    };
    var res = await CallApi().putData(data, 'signOutVisitor');
    var body = jsonDecode(res.body);
    return body;
  }

  //47

  authorisedMember(
    residentCode,
    validityStart,
    validityEnd,
    status,
    userGroup,
  ) async {
    var data = {
      "resident_code": residentCode,
      "validity_starts": validityStart,
      "validity_ends": validityEnd,
      "status": status,
      "user_group": userGroup,
      "action_user": "Sadmin"
    };
    var res = await CallApi().postData(data, 'finalAuthorization');
    var body = jsonDecode(res.body);
    return body;
  }

  //48
  eventRequestSelection(residentCode, action, eventId) async {
    var data = {
      "resident_code": residentCode,
      "action": action,
      "event_id": eventId
    };
    var res = await CallApi().postData(data, 'approveEventRequest');
    var body = jsonDecode(res.body);
    return body;
  }
}
