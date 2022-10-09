import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/buildEmploymentStatus.dart';
import 'package:magodo/components/buildStaffRelationshipDropdownList.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/services/services.dart';

class AddStaff extends StatefulWidget {
  final data;

  const AddStaff({Key? key, required this.data}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

TextEditingController _residentMobileNumber = TextEditingController();
TextEditingController _staffFullName = TextEditingController();
TextEditingController _staffAddress = TextEditingController();
TextEditingController _staffMobileNumber = TextEditingController();
TextEditingController _employmentDate = TextEditingController();
TextEditingController _contactDetails = TextEditingController();
TextEditingController _employDate = TextEditingController();

class _AddStaffState extends State<AddStaff> {
  String? relationship;
  String? employment;

  _addStaff() async {
    if (_staffFullName.text.isEmpty ||
        relationship == null ||
        employment == null ||
        _contactDetails.text.isEmpty ||
        _contactDetails.text.isEmpty) {
      var data = await Services().addStaff(
          widget.data['resident_phone'],
          _staffFullName.text,
          widget.data['resident_code'],
          _staffMobileNumber.text,
          relationship,
          employment,
          _contactDetails.text,
          _employDate.text);
      var message = data['error']['message'];

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
    var data = await Services().addStaff(
        widget.data['resident_phone'],
        _staffFullName.text,
        widget.data['resident_code'],
        _staffMobileNumber.text,
        relationship,
        employment,
        _contactDetails.text,
        _employDate.text);

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

  @override
  Widget build(BuildContext context) {
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
                      'Add Staff',
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
                              MobileNumberTextField(
                                  controller: _residentMobileNumber,
                                  fieldName: 'Resident Mobile Number',
                                  hintText: 'Enter your mobile number'),
                              NameTextField(
                                  controller: _staffFullName,
                                  hint: "Enter full name",
                                  nameType: "Staff Full Name"),
                              NameTextField(
                                  controller: _staffAddress,
                                  hint: "Enter staff address",
                                  nameType: "Staff Address"),
                              MobileNumberTextField(
                                  controller: _staffMobileNumber,
                                  fieldName: 'Staff Mobile Number',
                                  hintText: 'Enter staff mobile number'),
                              BuildRelationshipDropDownList(
                                relationship: relationship,
                                onChanged: (value) => setState(() {
                                  relationship = value as String;
                                }),
                              ),
                              BuildEmploymentDropDownList(
                                employment: employment,
                                onChanged: (value) => setState(() {
                                  employment = value as String;
                                }),
                              ),
                              const TextForForm(text: "Employment Date"),
                              CustomDatePicker(date: _employmentDate),
                              const SizedBox(
                                height: 30,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _addStaff();
                                  },
                                  text: 'Add Staff'),
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
