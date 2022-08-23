import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_form1.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/pages/forget_password_page/forget_password_second_page.dart';

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
    );
  }

  Widget _buildResidentCode() {
    return RoundedInputField(
      hintText: 'Enter resident code',
      controller: _residentCode,
    );
  }

  Widget _buildEmail() {
    return RoundedTextInputField(
      hintText: 'Enter email address',
      controller: _email,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 60, left: 30, right: 30
            ),
            color: color.AppColor.homePageBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForgetPasswordHeading(),
                const SizedBox(height: 20,),
                ForgetPasswordForm1(
                    residentCode: _buildResidentCode(),
                    mobileNumber: _buildMobileNumber(),
                    email: _buildEmail()),
                const SizedBox(height: 120,),
                ActionPageButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> const ForgetPasswordSecondPage()));
                }, text: 'Continue')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
