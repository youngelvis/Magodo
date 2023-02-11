import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../models/vehicle_dataModel/superAdminVehicleData.dart';
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
  FetchSuperAdminVehicle vehicleData;

  UpdateVehicleRegistration({Key? key, this.data, required this.vehicleData})
      : super(key: key);

  @override
  State<UpdateVehicleRegistration> createState() =>
      _UpdateVehicleRegistrationState();
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
    const String _apiUrl = 'updateVehicle';
    FormData formData;
    if (filename == null &&
        filePath == null &&
        widget.vehicleData.doc == null &&
        widget.vehicleData.docName == null) {
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
    } else if (filename == null && filePath == null) {
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
        "file": await MultipartFile.fromFile(widget.vehicleData.doc ?? "",
            filename: widget.vehicleData.docName ?? "")
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
            padding: EdgeInsets.only(
              top: 20.h,
            ),
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
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'Update Resident Vehicle details',
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'upload vehicle licence ',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NameTextField(
                                    controller: _vehicleCode,
                                    hint: "Enter code",
                                    nameType: widget.vehicleData.vehicleNo ??
                                        "Vehicle Code"),
                                NameTextField(
                                    controller: _vehicleMake,
                                    hint: widget.vehicleData.make ??
                                        "Enter make of vehicle",
                                    nameType: "Vehicle Make"),
                                NameTextField(
                                    controller: _vehicleModel,
                                    hint: "Enter model of vehicle",
                                    nameType: "Vehicle Make"),
                                BuildVehicleColorDropDownList(
                                    hint: widget.vehicleData.color,
                                    vehicleColor: colour,
                                    onChanged: (value) => setState(() {
                                          colour = value as String;
                                        })),
                                NameTextField(
                                    controller: _govtAgency,
                                    hint: widget.vehicleData.govAgency ??
                                        "gov agency",
                                    nameType: "Gov Agency"),
                                NameTextField(
                                    controller: _registrationNumber,
                                    hint: widget.vehicleData.registrationNo ??
                                        "Registration number",
                                    nameType: "Registration No"),
                                NameTextField(
                                    controller: _duesReceiptNo,
                                    hint: widget.vehicleData.receiptNo ??
                                        "mra receipt number",
                                    nameType: "Mra Dues Receipt No"),
                                MobileNumberTextField(
                                    controller: _amountPaid,
                                    fieldName: '(₦)Amount Paid',
                                    hintText: widget.vehicleData.amount ??
                                        'Enter amount paid'),
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
                                                    BorderRadius.circular(
                                                        12.0))),
                                        onPressed: () async {
                                          await selectFile();
                                        },
                                        child: const Icon(Icons.add))),
                                const SizedBox(
                                  height: 40,
                                ),
                                ActionPageButton(
                                    onPressed: () async {
                                      _registerNewVehicle();
                                    }, text: 'Submit'),
                                const SizedBox(
                                  height: 30,
                                ),
                              ]),
                        ),
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
