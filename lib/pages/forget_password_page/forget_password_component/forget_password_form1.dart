// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ForgetPasswordForm1 extends StatelessWidget {
  final residentCode;
  final mobileNumber;
  final email;

  const ForgetPasswordForm1({Key? key,
    required this.residentCode, required this.mobileNumber, required this.email })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),

        residentCode,
        const SizedBox(
          height: 20,
        ),
        mobileNumber,
        const SizedBox(
          height: 20,
        ),
        email,
        const SizedBox(
          height: 50,
        )
      ], );
  }
}