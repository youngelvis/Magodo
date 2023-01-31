// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_bulk_passcode/upload_file.dart';
import 'package:magodo/services/services.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class GetBulkPasscode extends StatefulWidget {
  ResidentModel? data;

  GetBulkPasscode({Key? key, required this.data}) : super(key: key);

  @override
  State<GetBulkPasscode> createState() => _GetBulkPasscodeState();
}

TextEditingController _date = TextEditingController();
TextEditingController _arrivalTime = TextEditingController();
TextEditingController _departureTime = TextEditingController();

class _GetBulkPasscodeState extends State<GetBulkPasscode> {
  var filename;
  var file;
  var filePath;

  Future selectFile() async {
    file = await Services().selectFile();
    filename = file['fileName'];
    filePath = file['path'];
  }

  getBulkPasscode_api() async {
    const String _url = "http://132.145.231.191/portal/mraLagosApp/api/";
    const String _apiUrl = 'getBulkPasscodes';
    FormData formData = FormData.fromMap({
      'resident_code': widget.data?.resident_code,
      'arival_date': _date.text,
      'time_from': _arrivalTime.text,
      'time_to': _departureTime.text,
      "file": await MultipartFile.fromFile(filePath, filename: filename)
    });

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

  _getBulkPasscode() async {
    if (_date.text.isEmpty ||
        _arrivalTime.text.isEmpty ||
        _departureTime.text.isEmpty) {
      var data = await getBulkPasscode_api();
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    var data = await getBulkPasscode_api();
    var message = data['message'];
    callMessage(message);
    _date.clear();
    _departureTime.clear();
    _arrivalTime.clear();
    filename = null;
    filePath = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 20.h,  ),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'Get Bulk Passcode',
                      style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Container(
                        padding:  EdgeInsets.only(right: 25.w, left: 25.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UploadFile(onPressed: () async {
                                await selectFile();
                              }),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  const Text('Supported file types: csv'),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              const TextForForm(text: "Arrival Date"),
                              CustomDatePicker(date: _date),
                              SizedBox(height: 20,),
                              const TextForForm(text: "Arrival Time"),
                              CustomTimePicker(
                                departureTime: _arrivalTime,
                                hint: 'Select arrival time',
                              ),

                              const TextForForm(text: "Departure Time"),
                              CustomTimePicker(
                                departureTime: _departureTime,
                                hint: 'Select departure time',
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _getBulkPasscode();
                                  },
                                  text: 'Get Bulk Passcode'),
                              const SizedBox(
                                height: 50,
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
