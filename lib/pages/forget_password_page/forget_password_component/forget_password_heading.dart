import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_page2_3_Subtitletext.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/main_body_title_text.dart';
class ForgetPasswordHeading extends StatelessWidget {
  const ForgetPasswordHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MainBodyTitleText(child: 'Reset Password'),
          SizedBox(height: 30.h),
          const ForgetPasswordPage2_3SubtitleText(child:'You can change your password for'),
          const ForgetPasswordPage2_3SubtitleText(child:'security reasons or reset it if'),
          const ForgetPasswordPage2_3SubtitleText(child:'you forgot it.'),
        ],
      ),
    );
  }
}
