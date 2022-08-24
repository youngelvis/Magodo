import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class RoundedPasswordField extends StatelessWidget {
  final controller;
  final suffixIcon;
  final obscureText;
  final validator;

  const RoundedPasswordField(
      {Key? key,
      required this.controller,
      required this.suffixIcon,
      this.obscureText,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Enter Password',
            icon: Icon(Icons.lock, color: color.AppColor.landingPageTitle),
            suffixIcon: suffixIcon,
            border: InputBorder.none),
        validator: validator,
      ),
    );
  }
}
