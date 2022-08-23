import 'package:flutter/material.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_page2_3_Subtitletext.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/main_body_title_text.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;
class ForgetPasswordHeading extends StatelessWidget {
  const ForgetPasswordHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  const [
          MainBodyTitleText(child: 'Reset Password'),
          SizedBox(height: 60),
          ForgetPasswordPage2_3SubtitleText(child:'You can change your password for'),
          ForgetPasswordPage2_3SubtitleText(child:'security reasons or reset it if'),
          ForgetPasswordPage2_3SubtitleText(child:'you forgot it.'),
        ],
      ),
    );
  }
}
