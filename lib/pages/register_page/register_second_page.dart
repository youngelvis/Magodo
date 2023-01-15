// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/terms_and_conditions.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/components/textfields_types/resident_type_dropdown_list.dart';
import 'package:magodo/components/textfields_types/zones.dart';
import 'package:magodo/models/registration_data_model/mainRegistrationData.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/pages/register_page/registration_page3.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/services/services.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationPage2 extends StatefulWidget {
  String mobileNumber, surname, firstname, email;

  RegistrationPage2(
      {Key? myKey,
      required this.firstname,
      required this.surname,
      required this.email,
      required this.mobileNumber})
      : super(key: myKey);

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

TextEditingController _address = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _RegistrationPage2State extends State<RegistrationPage2> {
  String? zone;
  MainRegistrationDataModel? registrationDataModel;

  String? residentType;

  bool _selectResidential = false;
  bool checkBoxValue = false;

  _register() async {
    var data = await Services().register(
        _password.text,
        widget.surname,
        widget.firstname,
        widget.email,
        zone,
        _address.text,
        residentType,
        _confirmPassword.text,
        widget.mobileNumber);
setState(() {
  registrationDataModel = data;
});
    if (registrationDataModel?.code == 400) {
      var message = registrationDataModel?.message;

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message!),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
  }

  _nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Registration_page3(
          mobileNumber: widget.mobileNumber,
          surname: widget.surname,
          firstname: widget.firstname,
          confirmPassword: _confirmPassword.text,
          password: _password.text,
          email: widget.email,
          residentialType: residentType.toString(),
          address: _address.text,
          zone: zone.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          color: color.AppColor.homePageBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpText(),
              RegistrationPagesForms(
                RegistrationPageBody: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 40.h,
                    ),
                    BuildZoneDropDownList(
                      zone: zone,
                      onChanged: (value) => setState(() {
                        zone = value as String;
                      }),
                    ),
                    NameTextField(
                        controller: _address,
                        hint: 'Enter your address',
                        nameType: 'Address'),

                    BuildResidentTypeDropDownList(
                        residentType: residentType,
                        onChanged: (value) => setState(() {
                              residentType = value as String;
                              residentType == 'Commercial'
                                  ? _selectResidential = true
                                  : _selectResidential = false;
                            })),
                    BuildPasswordTextField(
                        passwordController: _password, fieldName: 'Password'),

                    BuildPasswordTextField(
                        passwordController: _confirmPassword,
                        fieldName: 'Confirm Password'),
                    const SizedBox(
                      height: 15,
                    ),
                    const TermsAndConditions(),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
                reistrationPageButton: ActionPageButton(
                    text: _selectResidential ? 'Next' : 'Register Now',
                    onPressed: () async {
                      _selectResidential ? _nextPage() : await _register();
                    }),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
