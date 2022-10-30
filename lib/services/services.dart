import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:magodo/api/api.dart';
import 'package:open_file/open_file.dart';
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
  sendSMSPasscode(sendMsisdn,
      message,) async {
    var data = {"send_msisdn": sendMsisdn, "message": message};
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

  //8
  updateResidentProfile(residentCode,
      fullName,
      residentPhone,
      email,
      userGroup,
      status,
      address,
      residentType,
      validityStartsDate,
      ValidityEndsDate) async {
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
      "Validity_ends_date": ValidityEndsDate
    };

    var res = await CallApi().postData(data, 'updateResidentProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  //9
  updateCommercialProfile(residentPhone,
      fullName,
      residentCode,
      email,
      userGroup,
      status,
      residentType,
      address,
      validityStartsDate,
      ValidityEndsDate) async {
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
      "Validity_ends_date": ValidityEndsDate
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

  //14
  getBulkPasscode(file, residentCode, arrivalDate, timeFrom, timeTo) async {
    var data = {
      "file": file,
      "resident_code": residentCode,
      "arrival_date": arrivalDate,
      "time_from": timeFrom,
      "time_to": timeTo
    };
    print(data);
    var res = await CallApi().postData2(data, 'getBulkPasscode');
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

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    // final file = result.files.first;
    final path = result.files.first;

    return path;
  }

  Future baseName(file) async {
    final fileName = basename(file);
    return fileName;
  }
}
