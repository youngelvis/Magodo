import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class NavTextButton extends StatelessWidget {
  final icon;
  final text;
  final onPressed;

  const NavTextButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              size: 50,
              color: color.AppColor.landingPage2,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: color.AppColor.landingPage2,
              ),
            ),
            const SizedBox(height: 70)
          ],
        ));
  }
}
