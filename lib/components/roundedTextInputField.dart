// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';

class RoundedTextInputField extends StatelessWidget {
  final controller;
  final hintText;
  final validator;
  final icon;

  const RoundedTextInputField(
      {Key? key, this.controller, this.hintText, this.validator, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: icon
        ),
        validator: validator,
      ),
    );
  }
}
