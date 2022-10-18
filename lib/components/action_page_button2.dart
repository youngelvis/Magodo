import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;
class ActionPageButton2 extends StatelessWidget {
  final text;
  final onPressed;
  final primaryColor;
final height;
final width;

  const ActionPageButton2({Key? key,
    required this.onPressed, required this.text, required this.primaryColor, this.height, this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height:height?? 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            onPrimary: color.AppColor.landingPage2,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: color.AppColor.landingPage2,
              fontSize: 20),
        ),
      ),
    );
  }
}
