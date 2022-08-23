import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationPage3Body extends StatelessWidget {
  final buildStreetNameOrAddress;
  final buildBusinessName;
  final buildNumberOfStaffs;
  final buildBusinessMobileNumber;
  final buildBusinessEmail;

  const RegistrationPage3Body(
      {Key? key,
      required this.buildStreetNameOrAddress,
      required this.buildBusinessEmail,
      required this.buildNumberOfStaffs,
      required this.buildBusinessMobileNumber,
      required this.buildBusinessName})
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
          'Street Name/Address',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildStreetNameOrAddress,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Business Name',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildBusinessName,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Number Of Staffs',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildNumberOfStaffs,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Business Mobile Number',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildBusinessMobileNumber,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Business Email',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildBusinessEmail,
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
