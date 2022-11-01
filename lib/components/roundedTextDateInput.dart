// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class RoundedTextDateInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final controller;
  final validator;
  final onTap;

  const RoundedTextDateInput({Key? key,
    required this.hintText,
    this.icon = Icons.house,
    required this.controller,
    this.validator,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black12,
      child: TextFieldContainer(
        child: TextFormField(
          readOnly: true,
          onTap: onTap,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: Icon(
                icon,
                color: color.AppColor.landingPageTitle,
              )),
          validator: validator,
        ),
      ),
    );
  }
}
