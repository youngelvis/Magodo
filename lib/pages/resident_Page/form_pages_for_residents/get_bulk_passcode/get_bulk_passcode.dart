import 'dart:io';
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_bulk_passcode/upload_file.dart';
import 'package:magodo/services/services.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class GetBulkPasscode extends StatefulWidget {
  final data;

  const GetBulkPasscode({Key? key, required this.data}) : super(key: key);

  @override
  State<GetBulkPasscode> createState() => _GetBulkPasscodeState();
}

TextEditingController _date = TextEditingController();
TextEditingController _arrivalTime = TextEditingController();
TextEditingController _departureTime = TextEditingController();

class _GetBulkPasscodeState extends State<GetBulkPasscode> {
  File? file;

  Future selectFile() async {
    final path = await Services().selectFile();
    setState(() {
      file = File(path);
    });
  }

  _getBulkPasscode() async {
    final fileName = Services().baseName(file!.path);
    if (_arrivalTime.text.isEmpty ||
        _departureTime.text.isEmpty ||
        _date.text.isEmpty) {
      var data = await Services().getBulkPasscode(fileName,
          widget.data['resident_code'], _date, _arrivalTime, _departureTime);

      var message = data['error']['message'];

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
    var data = await Services().getBulkPasscode(fileName,
        widget.data['resident_code'], _date, _arrivalTime, _departureTime);

    var message = data['message'];

    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
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
                              const Text('Supported file types: csv'),
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
