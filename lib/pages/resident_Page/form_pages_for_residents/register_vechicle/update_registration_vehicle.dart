import 'dart:convert';
import 'package:dio/dio.dart';

import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/vehicle_color_dropdown_list.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';

import '../../../../components/title.dart';
class UpdateVehicleRegistration extends StatefulWidget {
  ResidentModel? data;
   UpdateVehicleRegistration({Key? key, this.data}) : super(key: key);

  @override
  State<UpdateVehicleRegistration> createState() => _UpdateVehicleRegistrationState();
}
TextEditingController _vehicleCode = TextEditingController();
TextEditingController _vehicleMake = TextEditingController();
TextEditingController _vehicleModel = TextEditingController();
TextEditingController _govtAgency = TextEditingController();
TextEditingController _registrationNumber = TextEditingController();
TextEditingController _duesReceiptNo = TextEditingController();
TextEditingController _amountPaid = TextEditingController();
class _UpdateVehicleRegistrationState extends State<UpdateVehicleRegistration> {
  String? colour;
  var filename;
  var file;
  var filePath;

  Future selectFile() async {
    file = await Services().selectFile();
    filename = file['fileName'];
    filePath = file['path'];
  }

  registerVehicle() async {
    const String _url = "http://132.145.231.191/portal/mraLagosApp/api/";
    const String _apiUrl = 'vehicleRegistration';
    FormData formData;
    if (filename == null && filePath == null) {
      formData = FormData.fromMap({
        'resident_code': widget.data?.resident_code,
        'make': _vehicleMake.text,
        'model': _vehicleModel.text,
        'color': colour,
        "gov_agency": _govtAgency.text,
        "reg_no": _registrationNumber.text,
        "vehicle_no": _vehicleCode.text.isEmpty ? '' : _vehicleCode.text,
        "receipt_no": _duesReceiptNo.text,
        "amount": _amountPaid.text,
        "action_user": widget.data?.resident_code,
      });
    } else {
      formData = FormData.fromMap({
        'resident_code': widget.data?.resident_code,
        'make': _vehicleMake.text,
        'model': _vehicleModel.text,
        'color': colour,
        "gov_agency": _govtAgency.text,
        "reg_no": _registrationNumber.text,
        "vehicle_no": _vehicleCode.text.isEmpty ? '' : _vehicleCode.text,
        "receipt_no": _duesReceiptNo.text,
        "amount": _amountPaid.text,
        "action_user": widget.data?.resident_code,
        "file": await MultipartFile.fromFile(filePath, filename: filename)
      });
    }
    var dio = Dio();
    var username = 'test';
    var password = 'benard@1991';
    var fullUrl = _url + _apiUrl;
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    dio.options.headers["Content-Type"] = 'multipart/form-data';
    dio.options.headers["authorization"] = basicAuth;

    final response = await dio.post(
      fullUrl,
      data: formData,
    );

    final responseBody = response.data;

    return responseBody;
  }

  callMessage(message) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  _registerNewVehicle() async {
    if (_vehicleMake.text.isEmpty ||
        _vehicleModel.text.isEmpty ||
        _govtAgency.text.isEmpty ||
        _registrationNumber.text.isEmpty ||
        _amountPaid.text.isEmpty ||
        _duesReceiptNo.text.isEmpty) {
      var data = await registerVehicle();
      var message = data['error']['message'];

      callMessage(message);
      return;
    }
    var data = await registerVehicle();
    var message = data['message'];

    callMessage(message);
    _vehicleMake.clear();
    _vehicleModel.clear();
    _govtAgency.clear();
    _registrationNumber.clear();
    _amountPaid.clear();
    _duesReceiptNo.clear();
    _vehicleCode.clear();
    colour = null;
    filename = null;
    filePath = null;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 20.h, left: 20.w, right: 10.w),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Text(
                      'Update Resident Vehicle details',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                Text(
                  'upload vehicle licence and supporting document',
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameTextField(
                                  controller: _vehicleCode,
                                  hint: "Enter code",
                                  nameType: "Vehicle Code"),
                              NameTextField(
                                  controller: _vehicleMake,
                                  hint: "Enter make of vehicle",
                                  nameType: "Email (Optional)"),
                              NameTextField(
                                  controller: _vehicleModel,
                                  hint: "Enter model of vehicle",
                                  nameType: "Vehicle Make"),
                              BuildVehicleColorDropDownList(
                                  vehicleColor: colour,
                                  onChanged: (value) => setState(() {
                                    colour = value as String;
                                  })),
                              NameTextField(
                                  controller: _govtAgency,
                                  hint: "gov agency",
                                  nameType: "Gov Agency"),
                              NameTextField(
                                  controller: _registrationNumber,
                                  hint: "Registration number",
                                  nameType: "Registration No"),
                              NameTextField(
                                  controller: _duesReceiptNo,
                                  hint: "mra receipt number",
                                  nameType: "Mra Dues Receipt No"),
                              MobileNumberTextField(
                                  controller: _amountPaid,
                                  fieldName: '(₦)Amount Paid',
                                  hintText: 'Enter amount paid'),
                              const TextForForm(text: 'Upload'),
                              SizedBox(
                                  height: 140,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12.0))),
                                      onPressed: () async{
                                        await selectFile();
                                      },
                                      child: const Icon(Icons.add))),
                              const SizedBox(
                                height: 40,
                              ),
                              ActionPageButton(
                                  onPressed: () async {}, text: 'Submit'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));

  }
}
