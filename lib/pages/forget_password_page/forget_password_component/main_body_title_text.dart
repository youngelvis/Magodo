// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class MainBodyTitleText extends StatelessWidget {
  final child;
  const MainBodyTitleText({Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(child, style: TextStyle(
        color: color.AppColor.landingPageTitle,
        fontSize: 35.sp,
        fontWeight: FontWeight.w900
    ),);
  }
}
