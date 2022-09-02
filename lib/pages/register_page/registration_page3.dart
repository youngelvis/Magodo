import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/category.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/register_page/registration_page_components/registration_page3_body.dart';

class Registration_page3 extends StatefulWidget {
  String mobileNumber,
      surname,
      firstname,
      email,
      zone,
      address,
      residentialType,
      password,
      confirmPassword;

  Registration_page3({
    Key? key,
    required this.mobileNumber,
    required this.surname,
    required this.email,
    required this.firstname,
    required this.password,
    required this.address,
    required this.confirmPassword,
    required this.residentialType,
    required this.zone,
  });

  @override
  State<Registration_page3> createState() => _Registration_page3State();
}

TextEditingController _streetNameOrNumber = TextEditingController();
TextEditingController _businessName = TextEditingController();
TextEditingController _numberOfStaff = TextEditingController();
TextEditingController _businessMobileNumber = TextEditingController();
TextEditingController _businessEmail = TextEditingController();
TextEditingController _category = TextEditingController();

class _Registration_page3State extends State<Registration_page3> {
  String? categoryType;
  final categoryOptions = [
    Category.SCHOOL,
    Category.CHURCH,
    Category.GYM_HOUSE,
    Category.HOSPITAL,
    Category.HOTEL,
    Category.ENTERTAINMENT,
    Category.MOSQUE,
    Category.OFFICE,
    Category.RESTAURANT,
    Category.SALOON,
    Category.SUPER_MARKET,
  ];
  Widget _buildCategoryOptions() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Category type',
        style: TextStyle(fontSize: 15),
      ),
      value: categoryType,
      onChanged: (value) => setState(() {
        categoryType = value as String;
      }),
      items: categoryOptions.map(buildResidentItem).toList(),
    );
  }

  DropdownMenuItem<String> buildResidentItem(String categoryOptions) =>
      DropdownMenuItem(
        value: categoryOptions,
        child: Text(
          categoryOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );
  _registerCommercial() async {
    var data = await Services().registerCommercial(
        widget.password,
        widget.surname,
        widget.firstname,
        widget.email,
        widget.zone,
        widget.address,
        widget.residentialType,
        widget.confirmPassword,
        widget.mobileNumber,
        _businessName.text,
        _numberOfStaff.text,
        _businessEmail.text,
        categoryType,
        _streetNameOrNumber.text,
        _businessMobileNumber.text);
    print(data);
  }

  Widget _buildBusinessMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter business mobile number',
      controller: _businessMobileNumber,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9+$]').hasMatch(value!)) {
          return "enter correct Business number";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildNumberOfStaffs() {
    return RoundedInputField(
      hintText: 'Enter number of staff',
      controller: _numberOfStaff,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return "enter correct number of staff";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildStreetNameOrAddress() {
    return RoundedTextInputField(
      hintText: 'Enter your street name',
      controller: _streetNameOrNumber,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct business address";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildBusinessName() {
    return RoundedTextInputField(
      hintText: 'Enter business name',
      controller: _businessName,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$]').hasMatch(value!)) {
          return "enter correct Business name";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildBusinessEmail() {
    return RoundedTextInputField(
      hintText: 'Enter business Email',
      controller: _businessEmail,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.) +[\w]{2,4}').hasMatch(value!)) {
          return "enter correct Business email";
        } else {
          return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          color: color.AppColor.homePageBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpText(),
              RegistrationPagesForms(
                RegistrationPageBody: RegistrationPage3Body(
                  buildCategoryOptions: _buildCategoryOptions(),
                  buildBusinessEmail: _buildBusinessEmail(),
                  buildBusinessMobileNumber:
                  _buildBusinessMobileNumber(),
                  buildBusinessName: _buildBusinessName(),
                  buildNumberOfStaffs: _buildNumberOfStaffs(),
                  buildStreetNameOrAddress:
                  _buildStreetNameOrAddress(),
                ),
                reistrationPageButton: ActionPageButton(
                    onPressed: () async {
                     await _registerCommercial();
                    }, text: 'Register Now'),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
