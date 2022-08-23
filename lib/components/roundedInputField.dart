import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.house,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: color.AppColor.landingPageTitle,
            )),
      ),
    );
  }
}
