// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/time_text_field.dart';
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
  late File file;

  Future selectFile() async {
    file = await Services().selectFile();
  }

  getBulkPasscode_api(filepath, fileName) async {
    const String _url = "http://132.145.231.191/portal/mraLagosApp/api/";
    const String _apiUrl = 'getBulkPasscodes';
    FormData formData = FormData.fromMap({
      'resident_code': widget.data?.resident_code,
      'arival_date': _date.text,
      'time_from': _arrivalTime.text,
      'time_to': _departureTime.text,
      "file": await MultipartFile.fromFile(filepath, filename: fileName)
    });

    var dio = Dio();
    var username = 'test';
    var password = 'benard@1991';
    var fullUrl = _url + _apiUrl;
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    dio.options.headers["Content-Type"] = 'multipart/form-data';
    dio.options.headers["authorization"] = basicAuth;

    Response response = await dio.post(
      fullUrl,
      data: formData,
    );

    print(response);
    return response;
  }

  _getBulkPasscode() async {
    var filename = await Services().baseName(file.path);
    if (_date.text.isEmpty ||
        _arrivalTime.text.isEmpty ||
        _departureTime.text.isEmpty) {
      getBulkPasscode_api(file.path, filename);
    }
    getBulkPasscode_api(file.path, filename);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                GetPasscodeTitleContainer(
                  title: 'Get Passcode',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Get Bulk Passcode',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
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
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UploadFile(onPressed: () async {
                                await selectFile();
                              }),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text('Supported file types: csv'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Arrival Date"),
                              CustomDatePicker(date: _date),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Arrival Time"),
                              CustomTimePicker(
                                departureTime: _arrivalTime,
                                hint: 'select arrival time',
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Departure Time"),
                              CustomTimePicker(
                                departureTime: _departureTime,
                                hint: 'select departure time',
                              ),
                              const SizedBox(
                                height: 50,
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
