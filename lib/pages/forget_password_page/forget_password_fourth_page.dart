import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedPasswordInput.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_form2.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_heading.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class ForgetPasswordFourthPage extends StatefulWidget {
  final pinNumber;

  const ForgetPasswordFourthPage({
    Key? key,
    required this.pinNumber,
  }) : super(key: key);

  @override
  State<ForgetPasswordFourthPage> createState() =>
      _ForgetPasswordFourthPageState();
}

TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _ForgetPasswordFourthPageState extends State<ForgetPasswordFourthPage> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  _handleSubmit() async {
    var data = await Services()
        .resetPassword(widget.pinNumber, _password.text, _confirmPassword.text);
    if (data['error'] == true) {
      var message = data['message'];

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
                color: color.AppColor.landingPageTitle)));
  }

  Widget _buildConfirmPassword() {
    return RoundedPasswordField(
        obscureText: _obscureText2,
        controller: _confirmPassword,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText2 = !_obscureText2;
              });
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                color: color.AppColor.landingPageTitle)));
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
                ForgetPasswordForm2(
                  password: _buildPassword(),
                  confirmPassword: _buildConfirmPassword(),
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
