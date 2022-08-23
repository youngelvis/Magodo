import 'package:flutter/material.dart';

import '../../../components/components_for_class_of_varable/colors.dart' as color;

class ForgetPasswordForm2 extends StatelessWidget {
  final confirmPassword;
  final password;

  const ForgetPasswordForm2(
      {Key? key, required this.confirmPassword, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
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
        password,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Confirm Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        confirmPassword,
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
