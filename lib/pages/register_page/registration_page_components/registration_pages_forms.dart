import 'package:flutter/material.dart';

class RegistrationPagesForms extends StatelessWidget {
  final RegistrationPageBody;
  final reistrationPageButton;

  const RegistrationPagesForms({Key? key,
    required this.RegistrationPageBody,
    required this.reistrationPageButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OverflowBox(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegistrationPageBody,
                  reistrationPageButton
                ]
            ),
          ),
        ),
      ),
    );
  }
}