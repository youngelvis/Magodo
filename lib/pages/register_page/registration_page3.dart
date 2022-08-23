import 'package:flutter/material.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/register_page/registration_page_components/registration_page3_body.dart';

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
  });

  @override
  State<Registration_page3> createState() => _Registration_page3State();
}

TextEditingController _streetNameOrNumber = TextEditingController();
TextEditingController _businessName = TextEditingController();
TextEditingController _numberOfStaff = TextEditingController();
TextEditingController _businessMobileNumber = TextEditingController();
TextEditingController _businessEmail = TextEditingController();

class _Registration_page3State extends State<Registration_page3> {
  Widget _buildBusinessMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter business mobile number',
      controller: _businessMobileNumber,
    );
  }

  Widget _buildNumberOfStaffs() {
    return RoundedInputField(
      hintText: 'Enter number of staff',
      controller: _numberOfStaff,
    );
  }

  Widget _buildStreetNameOrAddress() {
    return RoundedTextInputField(
      hintText: 'Enter your street name',
      controller: _streetNameOrNumber,
    );
  }

  Widget _buildBusinessName() {
    return RoundedTextInputField(
      hintText: 'Enter business name',
      controller: _businessName,
    );
  }

  Widget _buildBusinessEmail() {
    return RoundedTextInputField(
      hintText: 'Enter business Email',
      controller: _businessEmail,
    );
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
              const SignUpText(),
              RegistrationPagesForms(
                RegistrationPageBody: RegistrationPage3Body(
                  buildBusinessEmail: _buildBusinessEmail(),
                  buildBusinessMobileNumber:
                  _buildBusinessMobileNumber(),
                  buildBusinessName: _buildBusinessName(),
                  buildNumberOfStaffs: _buildNumberOfStaffs(),
                  buildStreetNameOrAddress:
                  _buildStreetNameOrAddress(),
                ),
                reistrationPageButton: ActionPageButton(
                    onPressed: () {}, text: 'Register Now'),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
