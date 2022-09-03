import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/title.dart';

class GetPasscode extends StatefulWidget {
  const GetPasscode({Key? key}) : super(key: key);

  @override
  State<GetPasscode> createState() => _GetPasscodeState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _visitorName = TextEditingController();
TextEditingController _email = TextEditingController();

class _GetPasscodeState extends State<GetPasscode> {
  String? noOfVisitors;
  final noOfVisitorsOptions = ['0', '1', '2', '3', '4', '5', '6'];


  Widget _buildNoOfVisitor() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Zone',
        style: TextStyle(fontSize: 15),
      ),
      value: noOfVisitors,
      onChanged: (value) => setState(() {
        noOfVisitors = value as String;
      }),
      items: noOfVisitorsOptions.map(buildNoOfVisitorsItem).toList(),
    );
  }

  DropdownMenuItem<String> buildNoOfVisitorsItem(String noOfVisitorsOptions) =>
      DropdownMenuItem(
        value: noOfVisitorsOptions,
        child: Text(
          noOfVisitorsOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  Widget _buildMobileNumber() {
    return RoundedInputField(
      hintText: "Enter Visitor's mobile number",
      controller: _mobileNumber,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9+$]')
                .hasMatch(value!)) {
          return "enter correct mobile Number";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildFirstName() {
    return RoundedTextInputField(
      hintText: 'Enter your visitor name',
      controller: _visitorName,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
          return "enter correct name";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildEmail() {
    return RoundedTextInputField(
      hintText: 'Enter email address',
      controller: _email,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(value!)) {
          return "enter correct email";
        } else {
          return null;
        }
      },
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TitleContainer(
                title: 'Get Passcode',
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: Column(children: [
                    const Text(
                      'Get Passcode',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                    const TextForForm(text: 'Mobile Number'),
                    _buildMobileNumber(),
                    const TextForForm(text: "Visitor's Name"),
                    _buildFirstName(),
                    const TextForForm(
                        text: "Number of Persons coming with Visitor"),
                    _buildNoOfVisitor(),
                    const TextForForm(text: "Email(optional"),
                    _buildEmail(),
                    ActionPageButton(onPressed: () {}, text: 'Get Passcode')
                  ]),),
            ],
          ),
        ),
      ),
    );
  }
}
