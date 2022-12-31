import 'package:flutter/material.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final sizes;
  const TextFieldContainer({
    Key? key,
    required this.child, this.sizes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: color.AppColor.landingPage2  ,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
