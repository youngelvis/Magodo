// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;
class ActionPageButton extends StatelessWidget {
  final text;
  final onPressed;
  const ActionPageButton({Key? key,
  required this.onPressed, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color.AppColor.homePageTheme,
            onPrimary: color.AppColor.landingPage2,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: color.AppColor.landingPage2,
              fontSize: 20),
        ),
      ),
    );
  }
}
