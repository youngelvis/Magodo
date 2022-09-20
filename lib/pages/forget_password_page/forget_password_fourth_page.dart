import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedPasswordInput.dart';
import 'package:magodo/components/textfieds_types/name_textfield.dart';
import 'package:magodo/components/textfieds_types/password_textfield.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

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


  _handleSubmit() async {
    var data = await Services()
        .resetPassword(_pinNumber.text, _password.text, _confirmPassword.text);
    if (data['error']['status'] == '400') {
      var message = data['error']['message'];
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
            ),
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
                const SizedBox(
                  height: 20,
                ),
                BuildPasswordTextField(
                    passwordController: _password, fieldName: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                BuildPasswordTextField(
                    passwordController: _confirmPassword,
                    fieldName: 'Confirm Password'),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 120,
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
