// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/dont_already_have_an_account.dart';
import 'package:magodo/components/roundedInputField.dart';

import 'package:magodo/components/roundedPasswordInput.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/pages/forget_password_page/forget_Password.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';
import 'package:magodo/services/services.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  _SignINState createState() => _SignINState();
}

TextEditingController _resident_code = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignINState extends State<SignIN> {
  bool login = false;
  void _navigation (data){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => data));
  }

_login() async {
    var data = await Services().login(_resident_code.text, _password.text);
    if(data['error'] == false){
     if (data['data']['usr_group'] == UserGroup.MEMBER) {
      _navigation( ResidentPageLandingPage(
        data: data['data'],
      ),);
    } else if (data['data']['usr_group'] == UserGroup.PROPERTY_OWNER) {

    }
  }else{

      var message = data['message'];

      return showDialog(
        context: context,
        builder:(_)=> AlertDialog(
          title: Text(message),
          actions: [
            TextButton(onPressed: (){
              _resident_code.text = '';
              _password.text = '';
              Navigator.of(context).pop();
            }, child: const Text("ok"))
          ],
        ),
      );
    }
}

  //varables
  bool isChecked = false;
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  //methods

  Widget _buildResidentCode() {
    return RoundedInputField(
      hintText: 'Enter resident code',
      controller: _resident_code,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct resident code";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPassword() {
    return RoundedPasswordField(
      obscureText: _obscureText,
      controller: _password,
      suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              color: color.AppColor.landingPageTitle)),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct password";
        } else {
          return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: color.AppColor.homePageBackground,
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: color.AppColor.landingPageTitle,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: color.AppColor.homeSecondaryTheme,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(child: DontAlreadyHaveAnAccount(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                    )),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'resident code',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: color.AppColor.homePageTitle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildResidentCode(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: color.AppColor.homePageTitle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildPassword(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  color.AppColor.homePageTheme),
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: color.AppColor.homePageTheme,
                            checkColor: Colors.white,
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 15, color: Colors.black26),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homeSecondaryTheme),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    ActionPageButton(
                      text: 'Log in',
                      onPressed: () async{
                        if (formKey.currentState!.validate()) {
                          final snackBar = SnackBar(content: await _login());
                          scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
