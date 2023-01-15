import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../models/forget_password_model/forgetPasswordResponse.dart';

class ForgetPasswordFourthPage extends StatefulWidget {
  const ForgetPasswordFourthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPasswordFourthPage> createState() =>
      _ForgetPasswordFourthPageState();
}

TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
TextEditingController _pinNumber = TextEditingController();

class _ForgetPasswordFourthPageState extends State<ForgetPasswordFourthPage> {
  ForgetPasswordResponse? response;
  _handleSubmit() async {
    if (_pinNumber.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty) {

    }
    var data = await Services()
        .resetPassword(_pinNumber.text, _password.text, _confirmPassword.text);
    setState(() {
      response = ForgetPasswordResponse.fromJson(data);
    });
    if (response?.error == true) {
      var message = response?.message;
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message!),
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
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Successfully changed your password'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIN()));
                _pinNumber.clear();
                _confirmPassword.clear();
                _password.clear();

              },
              child: const Text("ok"))
        ],
      ),
    );
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
                  height: 40,
                ),
                NameTextField(
                    controller: _pinNumber,
                    hint: 'pin',
                    nameType: 'Pin from sms'),

                BuildPasswordTextField(
                    passwordController: _password, fieldName: 'Password'),

                BuildPasswordTextField(
                    passwordController: _confirmPassword,
                    fieldName: 'Confirm Password'),

                 SizedBox(
                  height: 50.h,
                ),
                ActionPageButton(
                    onPressed: () async {
                      await _handleSubmit();
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
