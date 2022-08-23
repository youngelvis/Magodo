import 'package:flutter/material.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/pages/register_page/register_second_page.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_page_body.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

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
  @override
  bool isChecked = false;

  Widget _buildMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter your mobile number',
      controller: _mobileNumber,
    );
  }

  Widget _buildFirstName() {
    return RoundedTextInputField(
      hintText: 'Enter your firstname',
      controller: _firstname,
    );
  }

  Widget _buildEmail() {
    return RoundedTextInputField(
      hintText: 'Enter email address',
      controller: _email,
    );
  }

  Widget _buildSurname() {
    return RoundedTextInputField(
      hintText: 'Enter your surname',
      controller: _surname,
    );
  }

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
                RegistrationPageBody: RegistrationPageBody(
                buildEmail: _buildEmail(),
                buildFirstName: _buildFirstName(),
                buildMobileNumber: _buildMobileNumber(),
                buildSurname: _buildSurname(),
              ),
                reistrationPageButton: ActionPageButton(
                    text: 'Next',
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage2(
                          mobileNumber: _mobileNumber.text,
                          surname: _surname.text,
                          email: _email.text,
                          firstname: _firstname.text),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
