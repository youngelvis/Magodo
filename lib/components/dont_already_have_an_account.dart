import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class DontAlreadyHaveAnAccount extends StatelessWidget {
  final onPressed;

  const DontAlreadyHaveAnAccount({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
              fontSize: 20,
              color: color.AppColor.landingPageTitle,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Sign up',
            style: TextStyle(
              color: color.AppColor.signUp,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
