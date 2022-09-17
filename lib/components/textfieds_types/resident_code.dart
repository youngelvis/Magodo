import 'package:flutter/material.dart';
import 'package:magodo/components/roundedInputField.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class BuildResidentCode extends StatelessWidget {
  final residentCode;

  const BuildResidentCode({Key? key, required this.residentCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'resident code',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedInputField(
          hintText: 'Enter resident code',
          controller: residentCode,
        ),
      ],
    );
  }
}
