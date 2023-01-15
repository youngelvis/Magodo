import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

import '../../../services/services.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ValidateParent extends StatefulWidget {
  ResidentModel? data;

  ValidateParent({Key? key, this.data}) : super(key: key);

  @override
  State<ValidateParent> createState() => _ValidateParentState();
}

TextEditingController _passcode = TextEditingController();

class _ValidateParentState extends State<ValidateParent> {
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

  validateParent() async {
    if (_passcode.text.isEmpty) {
      var result = await Services().validateParent(_passcode.text);
      callMessage(result['error']["message"]);
    }
    final data = await Services().validateParent(_passcode.text);
    callMessage(data["message"]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                GetPasscodeTitleContainer(
                  title: 'Validate',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children:  [
                    Text(
                      'Validate Parent',
                      style: TextStyle(fontSize: 30.sp),
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
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameTextField(
                                  controller: _passcode,
                                  hint: "parent code",
                                  nameType: "Enter Parent code"),
                              const SizedBox(
                                height: 100,
                              ),
                              ActionPageButton(
                                  onPressed: () {
                                    validateParent();
                                  },
                                  text: 'Validate Parent'),
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
