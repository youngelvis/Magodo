// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
class NameTextField extends StatelessWidget {
  final nameType;
  final hint;
  final controller;
  const NameTextField({Key? key, required this.controller, required this.hint, required this.nameType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameType,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,

              color: color.AppColor.homePageTitle),
        ),
         SizedBox(
          height: 20.h,
        ),
        RoundedTextInputField(
          hintText: hint,
          controller: controller,
        ),
         SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
