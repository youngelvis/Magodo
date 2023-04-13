// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class AlreadyHaveAnAccount extends StatelessWidget {
  final onPressed;

  const AlreadyHaveAnAccount({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create your account or",
            style: TextStyle(
                fontSize: 20.sp,
                color: color.AppColor.landingPageTitle,
                fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'Sign in',
              style: TextStyle(
                color: color.AppColor.signUp,
                fontSize: 20.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
