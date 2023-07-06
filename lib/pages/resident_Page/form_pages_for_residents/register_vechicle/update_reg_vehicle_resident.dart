import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../components/components_for_class_of_varable/username_password.dart';
import '../../../../models/vehicle_dataModel/vehicledata.dart';
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

class UpdateVehicleRegistration2 extends StatefulWidget {
  ResidentModel? data;
  Vehicle vehicleData;


  UpdateVehicleRegistration2({Key? key, this.data, required this.vehicleData, })
      : super(key: key);

  @override
  State<UpdateVehicleRegistration2> createState() =>
      _UpdateVehicleRegistration2State();
}

TextEditingController _vehicleCode = TextEditingController();
TextEditingController _vehicleMake = TextEditingController();
TextEditingController _vehicleModel = TextEditingController();
TextEditingController _govtAgency = TextEditingController();
TextEditingController _registrationNumber = TextEditingController();
TextEditingController _duesReceiptNo = TextEditingController();
TextEditingController _amountPaid = TextEditingController();

class _UpdateVehicleRegistration2State extends State<UpdateVehicleRegistration2> {
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
        "guid_id": widget.vehicleData.guid,
        'resident_code': widget.data?.resident_code,
        'make': _vehicleMake.text.isEmpty
            ? widget.vehicleData.make
            : _vehicleMake.text,
        'model': _vehicleModel.text.isEmpty
            ? widget.vehicleData.model
            : _vehicleModel.text,
        'color': colour ?? widget.vehicleData.color,
        "gov_agency": _govtAgency.text.isEmpty
            ? widget.vehicleData.govAgency
            : _govtAgency.text,
        "reg_no": _registrationNumber.text.isEmpty
            ? widget.vehicleData.registrationNo
            : _registrationNumber.text,
        "vehicle_no": _vehicleCode.text.isEmpty
            ? widget.vehicleData.vehicleNo
            : _vehicleCode.text,
        "receipt_no": _duesReceiptNo.text.isEmpty
            ? widget.vehicleData.receiptNo
            : _duesReceiptNo.text,
        "amount": _amountPaid.text.isEmpty
            ? widget.vehicleData.amount
            : _amountPaid.text,
        "action_user": widget.data?.resident_code,
      });
    } else if (filename == null && filePath == null) {
      formData = FormData.fromMap({
        "guid_id": widget.vehicleData.guid,
        'resident_code': widget.data?.resident_code,
        'make': _vehicleMake.text.isEmpty
            ? widget.vehicleData.make
            : _vehicleMake.text,
        'model': _vehicleModel.text.isEmpty
            ? widget.vehicleData.model
            : _vehicleModel.text,
        'color': colour ?? widget.vehicleData.color,
        "gov_agency": _govtAgency.text.isEmpty
            ? widget.vehicleData.govAgency
            : _govtAgency.text,
        "reg_no": _registrationNumber.text.isEmpty
            ? widget.vehicleData.registrationNo
            : _registrationNumber.text,
        "vehicle_no": _vehicleCode.text.isEmpty
            ? widget.vehicleData.vehicleNo
            : _vehicleCode.text,
        "receipt_no": _duesReceiptNo.text.isEmpty
            ? widget.vehicleData.receiptNo
            : _duesReceiptNo.text,
        "amount": _amountPaid.text.isEmpty
            ? widget.vehicleData.amount
            : _amountPaid.text,
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
    var username = UsernameAndPassword.API_USERNAME;
    var password = UsernameAndPassword.API_PASSWORD;
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
                  foregroundColor: color.AppColor.landingPage2, backgroundColor: color.AppColor.homePageTheme,
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
    print(data);

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
            padding:EdgeInsets.only(top: 20.h,right: 10.w, left: 10.w),
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
                      'Update Resident Vehicle',
                      style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                                    hint: widget.vehicleData.vehicleNo ??
                                        "Enter code",
                                    nameType: "Vehicle Code"),
                                NameTextField(
                                    controller: _vehicleMake,
                                    hint: widget.vehicleData.make ??
                                        "Enter make of vehicle",
                                    nameType: "Vehicle Make"),
                                NameTextField(
                                    controller: _vehicleModel,
                                    hint: widget.vehicleData.model ??
                                        "Enter model of vehicle",
                                    nameType: "Vehicle Model"),
                                BuildVehicleColorDropDownList(
                                    hint: widget.vehicleData.color,
                                    vehicleColor: colour,
                                    onChanged: (value) => setState(() {
                                      colour = value as String;
                                    })),
                                NameTextField(
                                    controller: _govtAgency,
                                    hint: widget.vehicleData.govAgency ??
                                        "Registration State",
                                    nameType: "Registration State"),
                                NameTextField(
                                    controller: _registrationNumber,
                                    hint: widget.vehicleData.registrationNo ??
                                        "Registration number",
                                    nameType: "Registration No"),
                                NameTextField(
                                    controller: _duesReceiptNo,
                                    hint: widget.vehicleData.receiptNo ??
                                        "MRA receipt number",
                                    nameType: "MRA Dues Receipt No"),
                                MobileNumberTextField(
                                    controller: _amountPaid,
                                    fieldName: '(₦)Amount Paid',
                                    hintText: widget.vehicleData.amount ??
                                        'Enter amount paid'),
                                Row(
                                  children: [
                                    const TextForForm(text: 'Upload'),
                                    SizedBox(width: 5.w),
                                    Flexible(
                                      child: Text(
                                        widget.vehicleData.docName ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
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
                                    },
                                    text: 'Submit'),
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
