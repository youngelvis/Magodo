import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/pages/register_page/register_second_page.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/textfields_types/mobile_num_textfield.dart';
import '../login_page/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _surname = TextEditingController();
TextEditingController _firstname = TextEditingController();
TextEditingController _email = TextEditingController();

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  initState() {}
  final _formKeyScreen1 = GlobalKey<FormState>();

  clearForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationPage2(
          mobileNumber: _mobileNumber.text,
          surname: _surname.text,
          email: _email.text,
          firstname: _firstname.text,
        ),
      ),
    );

    Timer(Duration(seconds: 2), () {
      // <-- Delay here
      setState(() {
        _mobileNumber.clear();
        _surname.clear();
        _email.clear();
        _firstname.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          padding: EdgeInsets.only(
            top: 60.h,
          ),
          color: color.AppColor.homePageBackground,
          child: Form(
            key: _formKeyScreen1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 50,
                      color: color.AppColor.landingPageTitle,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SignIN(
                            )
                        ),
                      );
                    }),
                const SizedBox(
                  height: 25,
                ),
                const SignUpText(),
                RegistrationPagesForms(
                  RegistrationPageBody: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      MobileNumberTextField(
                          controller: _mobileNumber,
                          fieldName: 'Mobile Number',
                          hintText: 'Enter your mobile number'),
                      NameTextField(
                          controller: _surname,
                          hint: 'Enter Your surname',
                          nameType: 'Surname'),
                      NameTextField(
                          controller: _firstname,
                          hint: 'Enter Your firstname',
                          nameType: 'First Name'),
                      NameTextField(
                          controller: _email,
                          hint: 'Enter Your email address',
                          nameType: 'E-mail'),
                    ],
                  ),
                  reistrationPageButton: ActionPageButton(
                      text: 'Next',
                      onPressed: () {
                        clearForm();
                      }),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
