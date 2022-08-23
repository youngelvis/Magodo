import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

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
        Text(
          'Resident code',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        residentCode,
        const SizedBox(
          height: 20,
        ),
        Text(
          'mobile number',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        mobileNumber,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Mobile Email Address',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
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