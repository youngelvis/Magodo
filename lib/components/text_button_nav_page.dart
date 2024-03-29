// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class NavTextButton extends StatelessWidget {
  final space;
  final size;
  final icon;
  final text;
  final onPressed;
  final colored;
  final iconSize;
  final iconColored;

  const NavTextButton(
      {Key? key,
       this.icon,
      required this.text,
      required this.onPressed, this.size, this.colored, this.space, this.iconSize, this.iconColored})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: 10.w,),
            Icon(
              icon,
              size: iconSize??30.sp,
              color: iconColored?? color.AppColor.landingPage2,
            ),
             SizedBox(
              width: space??10.w,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize:size?? 16.sp,
                color: colored?? color.AppColor.landingPage2,
              ),
            ),
            const SizedBox(height: 70)
          ],
        ));
  }
}
