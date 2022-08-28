import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_page2_heading.dart';
import 'package:magodo/pages/forget_password_page/forget_password_component/forget_password_second_page_pin_row.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class ForgetPasswordSecondPage extends StatefulWidget {
  const ForgetPasswordSecondPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordSecondPage> createState() =>
      _ForgetPasswordSecondPageState();
}

int pinIndex = 0;
List<String> currentPin = ["", "", "", ""];
TextEditingController _textEditingController1 = TextEditingController();
TextEditingController _textEditingController2 = TextEditingController();
TextEditingController _textEditingController3 = TextEditingController();
TextEditingController _textEditingController4 = TextEditingController();

class _ForgetPasswordSecondPageState extends State<ForgetPasswordSecondPage> {
  @override
  Widget _buildPinRow() {
    return ForgetPasswordSecondPagePinRow(
      textEditingController1: _textEditingController1,
      textEditingController2: _textEditingController2,
      textEditingController3: _textEditingController3,
      textEditingController4: _textEditingController4,
    );
  }

  Duration _duration = Duration(seconds: 30);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            color: color.AppColor.homePageBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForgetPasswordPage2Heading(),
                Center(
                  child: CircularCountDownTimer(
                    isReverse: true,
                    width: 90,
                    height: 50,
                    duration: 90,
                    fillColor: Colors.transparent,
                    ringColor: Colors.transparent,
                    onComplete: () {},
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                _buildPinRow(),
                const SizedBox(
                  height: 450,
                ),
                ActionPageButton(
                  text: 'Submit Code',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
