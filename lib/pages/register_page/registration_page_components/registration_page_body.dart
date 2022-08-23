import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationPageBody extends StatelessWidget {
  final  buildMobileNumber;
  final buildSurname;
  final buildFirstName;
  final buildEmail;

  const RegistrationPageBody({Key? key,
  required this.buildEmail, required this.buildFirstName, required this.buildSurname, required this.buildMobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Mobile Number',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildMobileNumber,
        const SizedBox(
          height: 20,
        ),
        Text(
          'Surname',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSurname,
        const SizedBox(
          height: 20,
        ),
        Text(
          'FirstName',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildFirstName,
        const SizedBox(
          height: 20,
        ),
        Text(
          'E-mail',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        buildEmail,
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
