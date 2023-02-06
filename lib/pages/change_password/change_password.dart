// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';
import '../../components/title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class ChangePassword extends StatefulWidget {
  ResidentModel? data;

  ChangePassword({Key? key, required this.data}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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

  changePasscode() async {
    if (_currentPassword.text.isEmpty ||
        _newPassword.text.isEmpty ||
        _confirmPassword.text.isEmpty) {
      final data = await Services().changePassword(widget.data!.resident_code,
          _currentPassword.text, _newPassword.text, _confirmPassword.text);
      callMessage(data['error']['message']);
      return;
    }
    final data = await Services().changePassword(widget.data!.resident_code,
        _currentPassword.text, _newPassword.text, _confirmPassword.text);
    callMessage(data['message']);
    return;
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
                  height: 50.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
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
                                BuildPasswordTextField(
                                    fieldName: 'Current Password',
                                    passwordController: _currentPassword),
                                BuildPasswordTextField(
                                    fieldName: 'New Password',
                                    passwordController: _newPassword),
                                BuildPasswordTextField(
                                    fieldName: 'Confirm New Password',
                                    passwordController: _confirmPassword),
                                const SizedBox(
                                  height: 50,
                                ),
                                ActionPageButton(
                                    onPressed: () async {
                                      changePasscode();
                                    },
                                    text: 'Change Password'),
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
