import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class TextForForm extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;

  const TextForForm({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
