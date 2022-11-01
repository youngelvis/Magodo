// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/%20pin_number.dart';

class ForgetPasswordSecondPagePinRow extends StatelessWidget {
  final textEditingController1;

  final textEditingController2;

  final textEditingController3;

  final textEditingController4;

  const ForgetPasswordSecondPagePinRow(
      {Key? key,
      required this.textEditingController1,
      required this.textEditingController2,
      required this.textEditingController3,
      required this.textEditingController4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinNumber(
          textEditingController: textEditingController1,
        ),
        PinNumber(
          textEditingController: textEditingController2,
        ),
        PinNumber(
          textEditingController: textEditingController3,
        ),
        PinNumber(
          textEditingController: textEditingController4,
        ),
      ],
    );
  }
}
