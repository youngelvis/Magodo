import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;
class  ForgetPasswordPage2_3SubtitleText extends StatelessWidget {
  final child;
  const ForgetPasswordPage2_3SubtitleText ({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(child.toString(),
      style: TextStyle(
          color: color.AppColor.landingPageTitle,
          fontSize: 22,
          fontWeight: FontWeight.w400) ,);
  }
}
