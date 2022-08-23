import 'package:flutter/material.dart';
import 'package:magodo/components/terms_and_conditions.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationSecondPageBody extends StatelessWidget {
  final buildZone;
  final buildAddress;
  final buildResidentialType;
  final buildPassword;
  final buildConfirmPassword;

  const RegistrationSecondPageBody(
      {Key? key,
      required this.buildZone,
      required this.buildAddress,
      required this.buildResidentialType,
      required this.buildPassword,
      required this.buildConfirmPassword})
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
          'Zone',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildZone,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Address',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildAddress,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Residential Type',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildResidentialType,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildPassword,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Confirm Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildConfirmPassword,
        const SizedBox(
          height: 15,
        ),
        const TermsAndConditions(),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
