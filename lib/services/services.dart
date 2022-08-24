import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';

class Services {
  login(resident_code, password) async {
    var data = {"resident_code": resident_code, "password": password};

    var res = await CallApi().postData(data, 'login');
    var body = jsonDecode(res.body);
    return body;
  }

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
      "business_name" : business_name,
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
}
