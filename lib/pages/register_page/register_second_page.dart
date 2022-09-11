import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/zones.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_pages_forms.dart';
import 'package:magodo/components/roundedPasswordInput.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/pages/login_page/login_component/signUpText.dart';
import 'package:magodo/pages/register_page/registration_page3.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/pages/register_page/registration_page_components/registration_second_page.dart';
import 'package:magodo/services/services.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class RegistrationPage2 extends StatefulWidget {
  String mobileNumber, surname, firstname, email;

  RegistrationPage2(
      {Key? myKey,
      required this.firstname,
      required this.surname,
      required this.email,
      required this.mobileNumber})
      : super(key: myKey);

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

TextEditingController _address = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _RegistrationPage2State extends State<RegistrationPage2> {
  String? zone;
  final zoneOptions = [
    Zones.AEA,
    Zones.AGBOOLA_AJUMOBI,
    Zones.AKIN_TIJANI,
    Zones.BASHEER_SHITTU,
    Zones.BROADWAY,
    Zones.CENTRAL,
    Zones.FAA,
    Zones.FILLING_EGDE,
    Zones.FORESHORE,
    Zones.GORGE_VIEW,
    Zones.KAYODE_TAIWO,
    Zones.KOLA_AMODU,
    Zones.MAINLINE,
    Zones.NELSON_NWEKE,
    Zones.OGUNYE,
    Zones.PALM_VIEW,
    Zones.PEACE_VALLEY,
    Zones.PSSDC_WALE_TAIWO,
    Zones.SOUTH_EAST,
    Zones.SOUTH_WEST,
    Zones.VALLEY_VIEW
  ];
  String? residentType;
  final residentialOptions = [
    'Commercial',
    'Resident',
    'Property Owner',
  ];

  bool _selectResidential = false;
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool checkBoxValue = false;

  _register() async {
    var data = await Services().register(
        _password.text,
        widget.surname,
        widget.firstname,
        widget.email,
        zone,
        _address.text,
        residentType,
        _confirmPassword.text,
        widget.mobileNumber);

    if (data['error'] == true) {
      var message = data['message'];

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
  }

  _nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Registration_page3(
          mobileNumber: widget.mobileNumber,
          surname: widget.surname,
          firstname: widget.firstname,
          confirmPassword: _confirmPassword.text,
          password: _password.text,
          email: widget.email,
          residentialType: residentType.toString(),
          address: _address.text,
          zone: zone.toString(),
        ),
      ),
    );
  }

  Widget _buildZone() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Zone',
        style: TextStyle(fontSize: 15),
      ),
      value: zone,
      onChanged: (value) => setState(() {
        zone = value as String;
      }),
      items: zoneOptions.map(buildZoneItem).toList(),
    );
  }

  DropdownMenuItem<String> buildZoneItem(String zoneOptions) =>
      DropdownMenuItem(
        value: zoneOptions,
        child: Text(
          zoneOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  Widget _buildAddress() {
    return RoundedTextInputField(
      hintText: 'Enter your address',
      controller: _address,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct address";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildResidentialType() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Residential type',
        style: TextStyle(fontSize: 15),
      ),
      value: residentType,
      onChanged: (value) => setState(() {
        residentType = value as String;
        if (residentType == 'Commercial') {
          _selectResidential = true;
        } else {
          _selectResidential = false;
        }
      }),
      items: residentialOptions.map(buildResidentItem).toList(),
    );
  }

  DropdownMenuItem<String> buildResidentItem(String residentOptions) =>
      DropdownMenuItem(
          value: residentOptions,
          child: CheckboxListTile(
              title: Text(
                residentOptions,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 17),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  value = !checkBoxValue;
                });
              }));

  Widget _buildPassword() {
    return RoundedPasswordField(
      obscureText: _obscureText,
      controller: _password,
      suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              color: color.AppColor.landingPageTitle)),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct password";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildConfirmPassword() {
    return RoundedPasswordField(
      obscureText: _obscureText2,
      controller: _confirmPassword,
      suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText2 = !_obscureText2;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              color: color.AppColor.landingPageTitle)),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct Password";
        } else if (value != _password.text) {
          return "password is not correct";
        } else {
          return null;
        }
      },
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            color: color.AppColor.homePageBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignUpText(),
                RegistrationPagesForms(
                  RegistrationPageBody: RegistrationSecondPageBody(
                    buildAddress: _buildAddress(),
                    buildConfirmPassword: _buildConfirmPassword(),
                    buildPassword: _buildPassword(),
                    buildZone: _buildZone(),
                    buildResidentialType: _buildResidentialType(),
                  ),
                  reistrationPageButton: ActionPageButton(
                    text: _selectResidential ? 'Next' : 'Register Now',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final snackBar = SnackBar(
                            content: _selectResidential
                                ? _nextPage()
                                : await _register());
                        scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
