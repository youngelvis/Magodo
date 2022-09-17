import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;

  final controller;
  final validator;

  const RoundedInputField({
    Key? key,
    required this.hintText,

    required this.controller,
 this.validator,
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
          ),
          validator: validator,
        ),
      ),
    );
  }
}
