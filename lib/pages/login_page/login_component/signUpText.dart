// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:magodo/components/already_have_an_account.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          shadowColor: color.AppColor.homePageTheme,
          child: Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: color.AppColor.landingPageTitle,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Welcome',
            style: TextStyle(
                color: color.AppColor.homeSecondaryTheme,
                fontSize: 30,
                fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: AlreadyHaveAnAccount(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignIN()));
            },
          ),
        ),
      ],
    );
  }
}
