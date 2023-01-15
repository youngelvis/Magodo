// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/buildEmploymentStatus.dart';
import 'package:magodo/components/textfields_types/buildStaffRelationshipDropdownList.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class AddStaff extends StatefulWidget {
  final data;

  const AddStaff({Key? key, required this.data}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

TextEditingController _staffFullName = TextEditingController();

TextEditingController _staffMobileNumber = TextEditingController();
TextEditingController _staffAddress = TextEditingController();
TextEditingController _employmentDate = TextEditingController();

class _AddStaffState extends State<AddStaff> {
  String? relationship;
  String? employment;

  _addStaff() async {
    if (_staffFullName.text.isEmpty ||
        relationship == null ||
        employment == null ||
        _staffAddress.text.isEmpty ||
        _employmentDate.text.isEmpty) {
      var data = await Services().addStaff(
          widget.data['msisdn'],
          _staffFullName.text,
          widget.data['resident_code'],
          _staffMobileNumber.text,
          relationship,
          employment,
          _staffAddress.text,
          _employmentDate.text);
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
    var data = await Services().addStaff(
        widget.data['msisdn'],
        _staffFullName.text,
        widget.data['resident_code'],
        _staffMobileNumber.text,
        relationship,
        employment,
        _staffAddress.text,
        _employmentDate.text);

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children:  [
                    Text(
                      'Add Staff',
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                 SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
