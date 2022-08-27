import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final controller;
  final validator;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.house,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black12,
      child: TextFieldContainer(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: color.AppColor.landingPageTitle,
              )),
          validator: validator,
        ),
      ),
    );
  }
}
