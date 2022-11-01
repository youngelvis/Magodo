// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_page2_3_Subtitletext.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/main_body_title_text.dart';

class ForgetPasswordPage3Heading extends StatelessWidget {
  final text;

  const ForgetPasswordPage3Heading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MainBodyTitleText(child: 'Reset password'),
          const SizedBox(height: 60),
          const ForgetPasswordPage2_3SubtitleText(
              child: 'Please enter 4 digit code that was sent to'),
          ForgetPasswordPage2_3SubtitleText(child: text),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
