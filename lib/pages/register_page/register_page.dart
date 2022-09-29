import 'package:flutter/material.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/pages/register_page/register_second_page.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
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

  _nextButton() {
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
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        body: Form(
          child: Container(
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
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NameTextField(
                          controller: _surname,
                          hint: 'Enter Your surname',
                          nameType: 'Surname'),
                      const SizedBox(
                        height: 20,
                      ),
                      NameTextField(
                          controller: _firstname,
                          hint: 'Enter Your firstname',
                          nameType: 'First Name'),
                      const SizedBox(
                        height: 20,
                      ),
                      NameTextField(
                          controller: _email,
                          hint: 'Enter Your email address',
                          nameType: 'E-mail'),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  reistrationPageButton: ActionPageButton(
                      text: 'Next',
                      onPressed: () {
                        _nextButton();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
