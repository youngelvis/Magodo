// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class PinNumber extends StatelessWidget {
  final textEditingController;

  const PinNumber({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black12,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: color.AppColor.landingPage2,
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextField(
          controller: textEditingController,
          keyboardType: TextInputType.number,
          maxLength: 1,
          enabled: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              hintText: "-",
              border: InputBorder.none,
              counterText: "",
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: color.AppColor.landingPage2),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: color.AppColor.landingPageTitle),
        ),
      ),
    );
  }
}
