import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: Theme.of(context)
              .copyWith(unselectedWidgetColor: color.AppColor.homePageTheme),
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            activeColor: color.AppColor.homePageTheme,
            checkColor: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'I agree to the terms and conditions',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
