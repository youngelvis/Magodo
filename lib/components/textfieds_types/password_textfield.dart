import 'package:flutter/material.dart';
import 'package:magodo/components/roundedPasswordInput.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class BuildPasswordTextField extends StatefulWidget {
  final passwordController;
  final fieldName;

  const BuildPasswordTextField(
      {Key? key, required this.passwordController, required this.fieldName})
      : super(key: key);

  @override
  State<BuildPasswordTextField> createState() => _BuildPasswordTextFieldState();
}

class _BuildPasswordTextFieldState extends State<BuildPasswordTextField> {
  @override
  bool _obscureText = true;
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color.AppColor.homePageTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedPasswordField(
          obscureText: _obscureText,
          controller: widget.passwordController,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: color.AppColor.landingPageTitle)),
        ),
      ],
    );
    ;
  }
}
