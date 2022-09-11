import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_form1.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/pages/forget_password_page/forget_password_second_page.dart';
import 'package:magodo/services/services.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _residentCode = TextEditingController();
TextEditingController _email = TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
  Widget _buildMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter your mobile number',
      controller: _mobileNumber,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9+$]')
                .hasMatch(value!)) {
          return "enter correct mobile number";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildResidentCode() {
    return RoundedTextInputField(
      hintText: 'Enter resident code',
      controller: _residentCode,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct resident code";
        } else {
          return null;
        }
      },

    );
  }

  Widget _buildEmail() {
    return RoundedTextInputField(
      hintText: 'Enter email address',
      controller: _email,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[\w-\.]+@([\w-]+\.) +[\w-]{2,4}').hasMatch(value!)) {
          return "enter correct email";
        } else {
          return null;
        }
      },
    );
  }
_navigation(){
  Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) =>
  ForgetPasswordSecondPage(mobileNumber: _mobileNumber.text)));
}
  _getPassCode() async {
    var data = await Services().forgetPasswordGenerateToken(
        _residentCode.text, _email.text, _mobileNumber.text);

    if (data['error'] == true) {
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
    }else{
      _navigation();
    }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            color: color.AppColor.homePageBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForgetPasswordHeading(),
                const SizedBox(
                  height: 20,
                ),
                ForgetPasswordForm1(
                    residentCode: _buildResidentCode(),
                    mobileNumber: _buildMobileNumber(),
                    email: _buildEmail()),
                const SizedBox(
                  height: 120,
                ),
                ActionPageButton(
                    onPressed: () async{
                     await _getPassCode();
                    },
                    text: 'Continue')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
