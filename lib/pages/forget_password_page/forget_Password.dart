
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_form1.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/pages/forget_password_page/forget_password_fourth_page.dart';
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
  _navigation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ForgetPasswordFourthPage()));
  }

  _getPassCode() async {
    if (_residentCode.text.isEmpty ||
        _email.text.isEmpty ||
        _mobileNumber.text.isEmpty) {
      var data = await Services().forgetPasswordGenerateToken(
          _residentCode.text, _email.text, _mobileNumber.text);
      var message = data['error']['message'];

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
    var data = await Services().forgetPasswordGenerateToken(
        _residentCode.text, _email.text, _mobileNumber.text);

    if (data['error'] == true) {
      var message = data['message'];

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
    } else {
      _navigation();
    }
  }

  final formKey = GlobalKey<FormState>();

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
                    residentCode: NameTextField(
                      controller: _email,
                      hint: 'enter resident code',
                      nameType: 'Resident Code',
                    ),
                    mobileNumber: MobileNumberTextField(
                      controller: _mobileNumber,
                      fieldName: 'Mobile Number',
                      hintText: 'enter your mobile number',
                    ),
                    email: NameTextField(
                      controller: _email,
                      hint: 'enter your email',
                      nameType: ' E-mail',
                    )),
                const SizedBox(
                  height: 120,
                ),
                ActionPageButton(
                    onPressed: () async {
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
