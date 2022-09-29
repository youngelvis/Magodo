import 'package:flutter/material.dart';
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
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedTextInputField(
          hintText: hint,
          controller: controller,
        ),
      ],
    );
  }
}
