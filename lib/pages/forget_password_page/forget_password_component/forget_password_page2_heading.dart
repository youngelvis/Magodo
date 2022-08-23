import 'package:flutter/material.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_page2_3_Subtitletext.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/main_body_title_text.dart';

class ForgetPasswordPage2Heading extends StatelessWidget {


  const ForgetPasswordPage2Heading({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MainBodyTitleText(child: 'Reset password'),
          SizedBox(height: 60),
          ForgetPasswordPage2_3SubtitleText(child:'we sent otp verification to your',),
          ForgetPasswordPage2_3SubtitleText(child:'email. This code will expire in'),
          SizedBox(height: 100,)

        ],
      ),
    );
  }
}
