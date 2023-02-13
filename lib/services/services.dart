import 'dart:convert';
import 'package:file_picker/file_picker.dart';
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
    print(data);
    var res = await CallApi().postData(data, 'createResident');
    var body = jsonDecode(res.body);
    return body;
  }

//3
  registerCommercial(password,
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
  Future<dynamic> viewSentPasscodeReport(page,
      residentCode,
      search,) async {
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
  getPasscode(sendMsisdn,
      visitorName,
      residentCode,
      numberVisitor,
      email,) async {
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

  //9
  updateCommercialProfile(firstName,
      surname,
      residentPhone,
      email,
      residentType,
      address,
      residentData,
      businessAddress,
      businessName,
      staffNumber,
      businessMobileNumber,
      businessEmail,
      category) async {
    ResidentModel? residentModel = residentData;
    var data = {
      "full_name": residentModel?.usr_full_name,
      "resident_code": residentModel?.resident_code,
      "firstname": firstName,
      "surname": surname,
      "resident_phone": residentPhone,
      "email": email,
      "user_group": residentModel?.usr_group,
      "status": residentModel?.user_status,
      "mra_zone": residentModel?.zone,
      "resident_type": residentType,
      "address": address,
      "validity_starts_date": residentModel?.validity_starts,
      "validity_ends_date": residentModel?.validity_ends,
      "street_address": businessAddress ?? '',
      "business_name": businessName ?? '',
      "staff_number": staffNumber ?? '',
      "mobile_number": businessMobileNumber ?? '',
      "business_email": businessEmail ?? '',
      "category": category
    };
    print(data);
    var res = await CallApi().putData(data, 'updateCommercialProfile');
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
  doNotHonor(passcode,
      isChecked,) async {
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

    var res = await CallApi().deleteData(data, '8FamilyMember');
    var body = jsonDecode(res.body);
    return body;
  }

  //22
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.first;
    var data = {"fileName": path.name.toString(), "path": path.path.toString()};
    return data;
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
  changePassword(residentCode, currentPassword, newPassword,
      newConfirmPassword) async {
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
  addNewAdministrativeUser(residentCode,
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
      "action_user": residentCode
    };
    var res = await CallApi().postData(data, 'createAdmin');
    var body = jsonDecode(res.body);
    return body;
  }

  //29

  updateResidentProfile(firstName, surname, residentPhone, email, residentType,
      address, residentData) async {
    ResidentModel? residentModel = residentData;
    var data = {
      "full_name": residentModel?.usr_full_name,
      "resident_code": residentModel?.resident_code,
      "firstname": firstName,
      "surname": surname,
      "resident_phone": residentPhone,
      "email": email,
      "user_group": residentModel?.usr_group,
      "status": residentModel?.user_status,
      "mra_zone": residentModel?.zone,
      "resident_type": residentType,
      "address": address,
      "validity_starts_date": residentModel?.validity_starts,
      "validity_ends_date": residentModel?.validity_ends
    };
    var res = await CallApi().putData(data, 'updateResidentProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  // 30
  viewMembersReportForSAdmin(page, userGroup, zone, search) async {
    var data = {
      "search": search.toString(),
      "page": page,
      "limit": "10",
      "user_group": userGroup,
      "zone": zone
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

  updateResidentMember(residentCode,
      residentPhone,
      firstname,
      surname,
      email,
      userGroup,
      status,
      address,
      zone,
      validityStart,
      validityEnd,
      actionUser) async {
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
      "action_user": actionUser
    };
    print(data);
    var res = await CallApi().putData(data, 'updateMember');
    var body = jsonDecode(res.body);
    print(body);
    return body;
  }

  //36

  requestEvent(residentCode, population, scheduleDate, scheduleTime,
      eventType) async {
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

  validateStaffReport(page, search) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
    };

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
  passcodeHistory(page, search) async {
    var data = {"page": page, "limit": "10", "search": search.toString()};
    var res = await CallApi().postData(data, 'passcodeHistory');
    return res.body;
  }

  //42
  validatePasscode(passcode, userGroup, actionUser) async {
    var data = {
      "passcode": passcode,
      "action_user": actionUser,
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
  signOutVisitor(passcode, userGroup, actionUser) async {
    var data = {
      "passcode": passcode,
      "action_user": actionUser,
      "user_group": userGroup
    };
    var res = await CallApi().putData(data, 'signOutVisitor');
    var body = jsonDecode(res.body);
    return body;
  }

  //47

  finalAuthorization(residentCode,
      validityStart,
      validityEnd,
      status,
      userGroup,) async {
    var data = {
      "resident_code": residentCode,
      "validity_starts": validityStart,
      "validity_ends": validityEnd,
      "status": status,
      "user_group": userGroup,
      "action_user": residentCode
    };
    var res = await CallApi().putData(data, 'finalAuthorization');
    var body = jsonDecode(res.body);
    return body;
  }

  //48
  approveEventRequest(residentCode, action, eventId) async {
    var data = {
      "resident_code": residentCode,
      "action": action,
      "event_id": eventId
    };
    var res = await CallApi().postData(data, 'approveEventRequest');
    var body = jsonDecode(res.body);
    return body;
  }

  //49
  dependantsReport(page, search, zone) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "zone": zone
    };
    var res = await CallApi().postData(data, 'dependantsReport');
    return res.body;
  }

  //50
  adminPasscodeHistory(page, search, zone) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "zone": zone
    };
    var res = await CallApi().postData(data, 'adminPasscodeHistory');
    return res.body;
  }

  //51
  superAdminPasscodeHistory(page, search, zone) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "zone": zone
    };
    var res = await CallApi().postData(data, 'superAdminPasscodeHistory');
    return res.body;
  }

//52
  authorizeUser(residentCode, residentPhone, fullName, validityStart,
      validityEnds, actionAdmin, status) async {
    var data = {
      "resident_reg_code": residentCode,
      "resident_phone": residentPhone,
      "full_name": fullName,
      "validity_starts": validityStart,
      "validity_ends": validityEnds,
      "action_admin": actionAdmin,
      "status": status
    };
    var res = await CallApi().putData(data, 'authorizeUser');
    var body = jsonDecode(res.body);
    return body;
  }

  //53

  declineUser(residentCode, actionAdmin) async {
    var data = {
      "resident_reg_code": residentCode,
      "action_admin": actionAdmin,
    };
    var res = await CallApi().putData(data, 'declineUser');

    var body = jsonDecode(res.body);
    return body;
  }

  //54
  changeStaff(guid) async {
    var data = {
      "guid_id": guid,
    };
    var res = await CallApi().postData(data, 'changeStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //55
  adminActivityLogReport(page, search, zone) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "zone": zone
    };
    var res = await CallApi().postData(data, 'adminActivityLogReport');
    return res.body;
  }

  //56
  adminMovementRegisterReport(page, search, zone) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "zone": zone
    };
    var res = await CallApi().postData(data, 'adminMovementRegisterReport');
    return res.body;
  }

  //57
  addParent(residentCode, zone, email, residentName, residentPhone,
      parentFullName, businessName, parentAddress, parentMobileNumber) async {
    var data = {
      "resident_reg_code": residentCode,
      "zone": zone,
      "email": email,
      "resident_name": residentName,
      "resident_phone": residentPhone,
      "parent_full_name": parentFullName,
      "business_name": businessName,
      "parent_address": parentAddress,
      "parent_mobile_number": parentMobileNumber
    };
    var res = await CallApi().postData(data, 'addParent');
    var body = jsonDecode(res.body);
    return body;
  }

  //58

  parentReport(page, search, residentCode) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "resident_code": residentCode
    };
    var res = await CallApi().postData(data, 'parentReport');
    return res.body;
  }

//60
  getParentDetail(passcode) async {
    var data = {
      "parent_passcode": passcode,
    };
    var res = await CallApi().postData(data, 'getParentDetail');
    var body = jsonDecode(res.body);
    return body;
  }

//61

  verifyStaff(guid, status, actionUser) async {
    var data = {
      "guid_id": guid,
      "status": status,
      "action_user_resident_code": actionUser
    };
    var res = await CallApi().postData(data, 'verifyStaff');
    var body = jsonDecode(res.body);
    return body;
  }

//62
  declineStaff(guid, actionUser) async {
    var data = {"guid_staff": guid, "action_user_resident_code": actionUser};
    var res = await CallApi().putData(data, 'declineStaff');
    var body = jsonDecode(res.body);
    return body;
  }

//63
  extendParentValidity(residentCode, parentPasscode, parentPhone, parentName,
      validityStarts, validityEnds, address, status) async {
    var data = {
      "resident_code": residentCode,
      "parent_passcode": parentPasscode,
      "parent_phone": parentPhone,
      "parent_name": parentName,
      "validity_ends": validityEnds,
      "validity_starts": validityStarts,
      "address": address,
      "status": status
    };
    var res = await CallApi().postData(data, 'extendParentValidity');
    var body = jsonDecode(res.body);
    return body;
  }

  //64
  commercialEventReport(page, residentCode, search) async {
    var data = {
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "resident_code": residentCode
    };
    var res = await CallApi().postData(data, 'commercialEventReport');
    return res.body;
  }

  //65
  contactUs(email, name, subject, message) async {
    var data = {
      "email": email,
      "name": name,
      "subject": subject,
      "message": message
    };
    var res = await CallApi().postData(data, "contact");
    var body = jsonDecode(res.body);
    return body;
  }

  //66
  adminVehicleReport(startDate, startEnd, page, search, status, rfidMin,
      rfidMax, zone) async {
    var data = {
      "startDate": startDate,
      "startEnd": startEnd,
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "status": status,
      "rfid_min": rfidMin,
      "rfid_max": rfidMax,
      "zone": zone
    };
    var res = await CallApi().postData(data, "adminVehicleReport");
    return res.body;
  }

  //67
  issueRfid({guidId, rfid, userGroup, actionUser}) async {
    var data = {
      "guid_id": guidId,
      "rfid": rfid,
      "user_group": userGroup,
      "action_user": actionUser
    };
    var res = await CallApi().postData(data, "issueRfid");
    var body = jsonDecode(res.body);
    return body;
  }

  //68
  approveDeclineVehicle(action, actionUser, guidId) async {
    var data = {"action": action, "action_user": actionUser, "guid_id": guidId};
    print(data);
    var res = await CallApi().postData(data, "approveDeclineAction");
    var body = jsonDecode(res.body);
    return body;
  }

  //69
  activateRfid({residentCode, userGroup, actionUser}) async {
    var data = {
      "resident_code": residentCode,
      "user_group": userGroup,
      "action_user": actionUser
    };
    var res = await CallApi().postData(data, "activateRfid");
    var body = jsonDecode(res.body);
    return body;
  }

  //70
  deactivateRfid({residentCode, userGroup, actionUser}) async {
    var data = {
      "resident_code": residentCode,
      "user_group": userGroup,
      "action_user": actionUser
    };
    var res = await CallApi().postData(data, "deactivateRfid");
    var body = jsonDecode(res.body);
    return body;
  }

  //71
  revokeRfid({rfid, userGroup, actionUser}) async {
    var data = {
      "rfid": rfid,
      "user_group": userGroup,
      "action_user": actionUser
    };
    var res = await CallApi().postData(data, "revokeRfid");
    var body = jsonDecode(res.body);
    return body;
  }

  //72
  superAdminVehicleReport({startDate,
    startEnd,
    page,
    search,
    status,
    rfidMin,
    rfidMax,
    zone}) async {
    var data = {
      "startDate": startDate,
      "endDate": startEnd,
      "page": page,
      "limit": "10",
      "search": search.toString(),
      "status": status,
      "rfid_min": rfidMin,
      "rfid_max": rfidMax,
      "zone": zone
    };
    print("this is $data");
    var res = await CallApi().postData(data, "superAdminVehicleReport");

    return res.body;

  }

  //73
  issueRfidProximityCardNumber(residentCode, cardNumber, actionUser) async {
    var data = {
      "resident_code": residentCode,
      "cardNumber": cardNumber,
      "actionUser": actionUser
    };
    var res = await CallApi().postData(data, "RFIDProximityCard");
    var body = jsonDecode(res.body);
    return body;
  }

//74
  activateRfidProximityCardNumber(residentCode, cardNumber, actionUser) async {
    var data = {
      "resident_code": residentCode,
      "cardNumber": cardNumber,
      "actionUser": actionUser
    };
    var res = await CallApi().postData(data, "activateRFIDProximityCard");
    var body = jsonDecode(res.body);
    return body;
  }

//75
  deactivateRfidProximityCardNumber(residentCode, cardNumber,
      actionUser) async {
    var data = {
      "resident_code": residentCode,
      "cardNumber": cardNumber,
      "actionUser": actionUser
    };
    var res = await CallApi().postData(data, "deactivateRFIDProximityCard");
    var body = jsonDecode(res.body);
    return body;
  }

//76
  revokeRfidCardNumber(rfid, userGroup, actionUser) async {
    var data = {
      "rfid": rfid,
      "user_group": userGroup,
      "action_user": actionUser
    };
    var res = await CallApi().postData(data, "revokeRFIDCardNumber");
    var body = jsonDecode(res.body);
    return body;
  }

  //77

  rfidProximityCardReport(startDate, startEnd, page, search,) async {
    var data = {
      "startDate": startDate,
      "endDate": startEnd,
      "page": page,
      "limit": "10",
      "search": search.toString(),
    };
    var res = await CallApi().postData(data, "superAdminVehicleReport");
    return res;
  }

//78
  deleteVehicle(residentCode, guid) async {
    var data = {
      "resident_code": residentCode,
      "row_id": guid
    };
    var res = await CallApi().deleteData(data, "deleteVehicle");
    var body = jsonDecode(res.body);
    return body;
  }

  declineReason(
      {fullName, msisdn, email, guid, message, userGroup, actionUser}) async {
    var data = {
      "full_name": fullName,
      "msisdn": msisdn,
      "email": email,
      "guid_id": guid,
      "message": message,
      "user_group": userGroup,
      "action_user": actionUser
    };
    print(data);
    var res = await CallApi().postData(data, "vechicleDeclineReason");
    var body = jsonDecode(res.body);
    return body;

  }

}
