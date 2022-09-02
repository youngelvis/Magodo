import 'package:flutter/material.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationFormBody extends StatelessWidget {
  final registrationPageBody;
  final reistrationPageButton;

  const RegistrationFormBody(
      {Key? key,
      required this.registrationPageBody,
      required this.reistrationPageButton})
      : super(key: key);

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
              registrationPageBody,
              reistrationPageButton
            ],
          ),
        ),
      ),
    );
  }
}
