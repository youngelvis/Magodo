// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/already_have_an_account.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: color.AppColor.landingPageTitle,
                fontSize: 30.sp,
                fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: Text(
            'Welcome',
            style: TextStyle(
                color: color.AppColor.homeSecondaryTheme,
                fontSize: 35.sp,
                fontWeight: FontWeight.w900),
          ),
        ),
         SizedBox(
          height: 20.h,
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
