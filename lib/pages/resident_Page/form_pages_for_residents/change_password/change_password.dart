// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';

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

  changePasscode() async {
    if (_currentPassword.text.isEmpty ||
        _newPassword.text.isEmpty ||
        _confirmPassword.text.isEmpty) {
      final data = Services().changePassword(widget.data!.resident_code,
          _currentPassword.text, _newPassword.text, _confirmPassword.text);
    }
    final data = Services().changePassword(widget.data!.resident_code,
        _currentPassword.text, _newPassword.text, _confirmPassword.text);
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
                  title: 'Change Password',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
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
                                  onPressed: () async {},
                                  text: 'Submit Request'),
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
