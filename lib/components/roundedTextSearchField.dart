// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';

class RoundedTextSearchField extends StatelessWidget {
  final controller;
  final hintText;
  final validator;
  final icon;
  final onChanged;
  final suffix;

  const RoundedTextSearchField(
      {Key? key, this.controller, this.hintText, this.validator, this.icon, this.onChanged, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText, border: InputBorder.none, icon: icon, suffixIcon: suffix),
        validator: validator,
      ),
    );
  }
}
