// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class DontAlreadyHaveAnAccount extends StatelessWidget {
  final onPressed;

  const DontAlreadyHaveAnAccount({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
              fontSize: 20.sp,
              color: color.AppColor.landingPageTitle,
              fontWeight: FontWeight.w400),
        ),
         SizedBox(
          width: 20.w,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Sign up',
            style: TextStyle(
              color: color.AppColor.signUp,
              fontSize: 20.sp,
            ),
          ),
        )
      ],
    );
  }
}
