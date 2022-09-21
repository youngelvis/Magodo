import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:path/path.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';


class GetBulkPasscode extends StatefulWidget {
  const GetBulkPasscode({Key? key}) : super(key: key);

  @override
  State<GetBulkPasscode> createState() => _GetBulkPasscodeState();
}

class _GetBulkPasscodeState extends State<GetBulkPasscode> {
  TextEditingController _date = TextEditingController();
  TextEditingController _arrivalTime = TextEditingController();
  TextEditingController _departureTime = TextEditingController();
  File? file;
  Future selectFile()async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result == null)return;
    final path = result.files.single.path!;
    setState(()=> file = File(path));
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path): 'No File selected';
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                const GetPasscodeTitleContainer(
                  title: 'Get Passcode',
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
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ActionPageButton(onPressed: selectFile(), text: 'select file'),
                              Text(fileName),
                              const TextForForm(text: "Arrival Date"),
                              CustomDatePicker(date: _date),
                              const TextForForm(text: "Arrival Time"),
                              CustomTimePicker(departureTime: _arrivalTime, hint: 'select arrival time',),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Departure Time"),
                              CustomTimePicker(departureTime: _departureTime, hint: 'select departure time',),
                              const SizedBox(
                                height: 30,
                              ),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Get Passcode'),
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
