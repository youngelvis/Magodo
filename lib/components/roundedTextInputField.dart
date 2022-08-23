import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class RoundedTextInputField extends StatelessWidget {
  final controller;
  final hintText;
  const RoundedTextInputField({Key? key,
  this.controller,
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            ),
      ),
    );
  }
}
