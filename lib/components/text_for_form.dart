import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class TextForForm extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;

  const TextForForm({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18.sp,

              fontWeight: FontWeight.w600,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
