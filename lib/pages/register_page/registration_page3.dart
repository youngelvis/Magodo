import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/category.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

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
    if (data['error']['status'] == "400") {
      var message = data['error']['message'];

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
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
                RegistrationPageBody: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: color.AppColor.homePageTitle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildCategoryOptions(),
                    const SizedBox(
                      height: 20,
                    ),
                    NameTextField(
                        controller: _streetNameOrNumber,
                        hint: 'Enter your street name',
                        nameType: "Street Name/Address"),
                    const SizedBox(
                      height: 20,
                    ),
                    NameTextField(
                        controller: _businessName,
                        hint: 'Enter business name',
                        nameType: "Business Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    NameTextField(
                        controller: _numberOfStaff,
                        hint: 'Enter number of staff',
                        nameType: "Number of Staffs"),
                    const SizedBox(
                      height: 20,
                    ),
                    MobileNumberTextField(
                        controller: _businessMobileNumber,
                        fieldName: 'Business Mobile Number',
                        hintText: 'Enter business mobile number'),
                    const SizedBox(
                      height: 20,
                    ),
                    NameTextField(
                        controller: _businessEmail,
                        hint: 'Enter business email',
                        nameType: "Business Email"),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
                reistrationPageButton: ActionPageButton(
                    onPressed: () async {
                      await _registerCommercial();
                    },
                    text: 'Register Now'),
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
