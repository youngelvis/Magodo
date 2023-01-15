// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/components_for_class_of_varable/colors.dart'
    as color;

// ignore: camel_case_types
class ForgetPasswordPage2_3SubtitleText extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;

  const ForgetPasswordPage2_3SubtitleText({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      child.toString(),
      style: TextStyle(
          color: color.AppColor.landingPageTitle,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400),
    );
  }
}
