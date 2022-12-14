// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class AddFamily extends StatefulWidget {
  ResidentModel? data;

   AddFamily({Key? key, required this.data}) : super(key: key);

  @override
  State<AddFamily> createState() => _AddFamilyState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _AddFamilyState extends State<AddFamily> {
  @override
  Widget build(BuildContext context) {
    _addFamily() async {
      if (_mobileNumber.text.isEmpty ||
          _fullName.text.isEmpty ||
          _email.text.isEmpty ||
          _password.text.isEmpty ||
          _confirmPassword.text.isEmpty) {
        var data = await Services().addFamilyMember(
            widget.data?.resident_code,
            _mobileNumber.text,
            _fullName.text,
            _email.text,
            _password.text,
            _confirmPassword.text);
        var message = data['error']['message'];

        return showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(message),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: color.AppColor.homePageTheme,
                      onPrimary: color.AppColor.landingPage2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("ok"))
            ],
          ),
        );
      }
      var data = await Services().addFamilyMember(
          widget.data?.resident_code,
          _mobileNumber.text,
          _fullName.text,
          _email.text,
          _password.text,
          _confirmPassword.text);

      var message = data['message'];

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }

    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Add Family',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameTextField(
                                  controller: _fullName,
                                  hint: "Enter full name",
                                  nameType: "Full Name"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: ' Mobile Number',
                                  hintText: 'Enter mobile number'),
                              NameTextField(
                                  controller: _email,
                                  hint: "Enter email",
                                  nameType: "Enter email address"),
                              BuildPasswordTextField(
                                  fieldName: 'Password', passwordController: _password),
                              BuildPasswordTextField(
                                  fieldName: 'Confirm Password', passwordController: _confirmPassword),

                              const SizedBox(
                                height: 40,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _addFamily();
                                  },
                                  text: 'Add Family'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
