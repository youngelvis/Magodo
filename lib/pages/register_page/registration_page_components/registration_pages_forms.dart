// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPagesForms extends StatelessWidget {
  final RegistrationPageBody;
  final reistrationPageButton;

  const RegistrationPagesForms({Key? key,
    required this.RegistrationPageBody,
    required this.reistrationPageButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OverflowBox(
        child: SingleChildScrollView(
          child: Container(
            padding:  EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegistrationPageBody,
                  reistrationPageButton
                ]
            ),
          ),
        ),
      ),
    );
  }
}