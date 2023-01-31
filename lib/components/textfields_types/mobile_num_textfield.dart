// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedInputField.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class MobileNumberTextField extends StatelessWidget {
  final fieldName;
  final controller;
  final hintText;

  const MobileNumberTextField(
      {Key? key,
      required this.controller,
      required this.fieldName,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedInputField(
          hintText: hintText,
          controller: controller,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
