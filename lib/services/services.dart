import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';

class Services {
  // 1
  Future<dynamic> login(resident_code, password) async {
    var data = {"resident_code": resident_code, "password": password};

    var res = await CallApi().postData(data, 'login');
    var body = jsonDecode(res.body);
    return body;
  }

//2
  register(password, surname, firstname, email, zone, address, resident_type,
      confirm_password, resident_phone) async {
    var data = {
      "resident_phone": resident_phone,
      "surname": surname,
      "firstname": firstname,
      "email": email,
      "zone": zone,
      "password": password,
      "confirm_password": confirm_password,
      "address": address,
      "resident_type": resident_type
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
      resident_type,
      confirm_password,
      resident_phone,
      business_name,
      staff_number,
      business_email,
      category,
      street_address,
      mobile_number) async {
    var data = {
      "resident_phone": resident_phone,
      "surname": surname,
      "firstname": firstname,
      "email": email,
      "zone": zone,
      "password": password,
      "confirm_password": confirm_password,
      "address": address,
      "resident_type": resident_type,
      "business_name": business_name,
      "business_email": business_email,
      "staff_numbers": staff_number,
      "category": category,
      "street_address": street_address,
      "mobile_number": mobile_number
    };

    var res = await CallApi().postData(data, 'createCommercial');
    var body = jsonDecode(res.body);
    return body;
  }

//4
  Future<dynamic> viewSentPasscodeReport(
    page,
    limit,
    resident_code,
    search,
  ) async {
    var data = {
      "page": page,
      "limit": limit,
      "resident_code": resident_code,
      "search": search
    };
    var res = await CallApi().postData(data, 'viewSentPasscode');

    return res.body;
  }

  //5
  sendSMSPasscode(
    send_msisdn,
    message,
  ) async {
    var data = {"send_msisdn": send_msisdn, "message": message};
    var res = await CallApi().postData(data, 'sendSMSPasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //6
  getFuturePasscode(send_msisdn, visitor_name, resident_code, number_visitor,
      email, arival_date, time_from, time_to) async {
    var data = {
      "send_msisdn": send_msisdn,
      "visitor_name": visitor_name,
      "resident_code": resident_code,
      "number_visitor": number_visitor,
      "email": email,
      "arival_date": arival_date,
      "time_from": time_from,
      "time_to": time_to,
    };
    var res = await CallApi().postData(data, 'getFuturePasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //7
  getPasscode(
    send_msisdn,
    visitor_name,
    resident_code,
    number_visitor,
    email,
  ) async {
    assert(email != null);
    var data = {
      "send_msisdn": send_msisdn,
      "visitor_name": visitor_name,
      "resident_code": resident_code,
      "number_visitor": number_visitor,
      "email": email,
    };
    var res = await CallApi().postData(data, 'getPasscode');
    var body = jsonDecode(res.body);
    return body;
  }

  //8
  updateResidentProfile(
      resident_code,
      full_name,
      resident_phone,
      email,
      user_group,
      status,
      address,
      resident_type,
      validity_starts_date,
      Validity_ends_date) async {
    var data = {
      "resident_code": resident_code,
      "full_name": full_name,
      "resident_phone": resident_phone,
      "email": email,
      "user_group": user_group,
      "status": status,
      "address": address,
      "resident_type": resident_type,
      "validity_starts_date": validity_starts_date,
      "Validity_ends_date": Validity_ends_date
    };

    var res = await CallApi().postData(data, 'updateResidentProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  //9
  updateCommercialProfile(
      resident_phone,
      full_name,
      resident_code,
      email,
      user_group,
      status,
      resident_type,
      address,
      validity_starts_date,
      Validity_ends_date) async {
    var data = {
      "resident_code": resident_code,
      "resident_phone": resident_phone,
      "full_name": full_name,
      "email": email,
      "user_group": user_group,
      "status": status,
      "resident_type": resident_type,
      "address": address,
      "validity_starts_date": validity_starts_date,
      "Validity_ends_date": Validity_ends_date
    };

    var res = await CallApi().postData(data, 'updateCommercialProfile');
    var body = jsonDecode(res.body);
    return body;
  }

  //10
  addStaff(
    resident_phone,
    full_name,
    resident_code,
    email,
    dependant_phone,
    relationship,
    employment_status,
    contact_detail,
  ) async {
    var data = {
      "resident_code": resident_code,
      "resident_phone": resident_phone,
      "full_name": full_name,
      "email": email,
      "dependant_phone": dependant_phone,
      "relationship": relationship,
      "employment_status": employment_status,
      "contact_detail": contact_detail,
    };

    var res = await CallApi().postData(data, 'addStaff');
    var body = jsonDecode(res.body);
    return body;
  }

  //11
  addFamilyMember(resident_phone, full_name, resident_code, email, password,
      Confirm_password) async {
    var data = {
      "resident_code": resident_code,
      "resident_phone": resident_phone,
      "full_name": full_name,
      "email": email,
      "password": password,
      "Confirm_password": Confirm_password,
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

    var res = await CallApi().postData(data, 'addFamilyMember');
    var body = jsonDecode(res.body);
    return body;
  }
}
