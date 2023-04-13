// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/textfields_types/category_drop_down_list.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/models/registration_data_model/mainRegistrationData.dart';
import 'package:magodo/models/resident_data_model/wrongDetailsResident.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/register_page/register_second_page.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/terms_and_conditions.dart';

class Registration_page3 extends StatefulWidget {
  String mobileNumber,
      surname,
      firstname,
      email,
      zone,
      address,
      residentialType,
      password,
      confirmPassword;

  Registration_page3({
    Key? key,
    required this.mobileNumber,
    required this.surname,
    required this.email,
    required this.firstname,
    required this.password,
    required this.address,
    required this.confirmPassword,
    required this.residentialType,
    required this.zone,
  }) : super(key: key);

  @override
  State<Registration_page3> createState() => _Registration_page3State();
}

TextEditingController _streetNameOrNumber = TextEditingController();
TextEditingController _businessName = TextEditingController();
TextEditingController _numberOfStaff = TextEditingController();
TextEditingController _businessMobileNumber = TextEditingController();
TextEditingController _businessEmail = TextEditingController();

class _Registration_page3State extends State<Registration_page3> {
  String? categoryType;
  MainRegistrationDataModel? commercialData;
  bool isChecked = false;

  callMessage3() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Please accept our Privacy Policy be you can register"),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: color.AppColor.landingPage2,
                  backgroundColor: color.AppColor.homePageTheme,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  _registerCommercial() async {
    if (isChecked == false) {
      callMessage3();
      return;
    }
    if (widget.password.isEmpty ||
        widget.mobileNumber.isEmpty ||
        widget.surname.isEmpty ||
        widget.email.isEmpty ||
        widget.firstname.isEmpty ||
        widget.zone.isEmpty ||
        widget.address.isEmpty ||
        widget.residentialType.isEmpty ||
        widget.confirmPassword.isEmpty ||
        widget.mobileNumber.isEmpty ||
        _businessName.text.isEmpty ||
        _businessEmail.text.isEmpty ||
        categoryType == null ||
        _streetNameOrNumber.text.isEmpty ||
        _businessMobileNumber.text.isEmpty) {
      var data = await Services().registerCommercial(
          widget.password,
          widget.surname,
          widget.firstname,
          widget.email,
          widget.zone,
          widget.address,
          widget.residentialType,
          widget.confirmPassword,
          widget.mobileNumber,
          _businessName.text,
          _numberOfStaff.text,
          _businessEmail.text,
          categoryType,
          _streetNameOrNumber.text,
          _businessMobileNumber.text);
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    var data = await Services().registerCommercial(
        widget.password,
        widget.surname,
        widget.firstname,
        widget.email,
        widget.zone,
        widget.address,
        widget.residentialType,
        widget.confirmPassword,
        widget.mobileNumber,
        _businessName.text,
        _numberOfStaff.text,
        _businessEmail.text,
        categoryType,
        _streetNameOrNumber.text,
        _businessMobileNumber.text);
    print(data);
    var message = data['message'];
    callMessage(message);
    widget.password = '';
    widget.zone = '';
    widget.address = '';
    widget.residentialType = '';
    widget.surname == '';
    widget.firstname == '';
    widget.email = '';
    widget.mobileNumber = '';
    widget.confirmPassword = '';
    _businessName.clear();
    _numberOfStaff.clear();
    _businessEmail.clear();
    categoryType = null;
    _streetNameOrNumber.clear();
    _businessMobileNumber.clear();

    return;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          color: color.AppColor.homePageBackground,
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
                          builder: (context) => RegistrationPage2(
                                firstname: widget.firstname,
                                surname: widget.surname,
                                email: widget.email,
                                mobileNumber: widget.mobileNumber,
                              )),
                    );
                  }),
              const SizedBox(
                height: 25,
              ),
              const SignUpText(),
              RegistrationPagesForms(
                RegistrationPageBody: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    BuildCategoryDropDownList(
                      onChanged: (value) => setState(() {
                        categoryType = value as String;
                      }),
                      category: categoryType,
                    ),
                    NameTextField(
                        controller: _streetNameOrNumber,
                        hint: 'Enter your street name',
                        nameType: "Street Name/Address"),
                    NameTextField(
                        controller: _businessName,
                        hint: 'Enter business name',
                        nameType: "Business Name"),
                    NameTextField(
                        controller: _numberOfStaff,
                        hint: 'Enter number of staff',
                        nameType: "Number of Staffs"),
                    MobileNumberTextField(
                        controller: _businessMobileNumber,
                        fieldName: 'Business Mobile Number',
                        hintText: 'Enter business mobile number'),
                    NameTextField(
                        controller: _businessEmail,
                        hint: 'Enter business email',
                        nameType: "Business Email"),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
                reistrationPageButton: ActionPageButton(
                    onPressed: () async {
                      await _registerCommercial();
                    },
                    text: 'Register Now'),),
              SizedBox(
                height: 20.h,
              ),

              TermsAndConditions(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
