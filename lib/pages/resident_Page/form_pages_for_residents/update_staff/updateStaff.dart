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
import 'package:magodo/models/add_staff_data_model/staffdata.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class UpdateStaff extends StatefulWidget {
  ResidentModel? data;
  Staff? staff;

  UpdateStaff({Key? key, required this.data, this.staff}) : super(key: key);

  @override
  State<UpdateStaff> createState() => _UpdateStaffState();
}

TextEditingController _staffFullName = TextEditingController();

TextEditingController _staffMobileNumber = TextEditingController();
TextEditingController _staffAddress = TextEditingController();
TextEditingController _employmentDate = TextEditingController();

class _UpdateStaffState extends State<UpdateStaff> {
  String? relationship;
  String? employment;

  _updateStaff() async {
    var data = await Services().updateStaff(
        _staffFullName.text.isEmpty ? widget.staff?.dependantName: _staffFullName.text,
        _staffMobileNumber.text.isEmpty ? widget.staff?.dependantPhone:_staffMobileNumber.text,
        employment,
        _employmentDate.text.isEmpty ? widget.staff?.empdateOrDob:_employmentDate.text,
        _staffAddress.text.isEmpty ? widget.staff?.dependantContacts:_staffAddress.text,
        relationship,
        widget.staff);

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
            padding: EdgeInsets.only(top: 20.h, left: 10.w),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Text(
                      'Update Staff',
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NameTextField(
                                controller: _staffFullName,
                                hint: "${widget.staff?.dependantName}",
                                nameType: "Staff Full Name"),
                            NameTextField(
                                controller: _staffAddress,
                                hint: "${widget.staff?.dependantContacts}",
                                nameType: "Staff Address"),
                            MobileNumberTextField(
                                controller: _staffMobileNumber,
                                fieldName: 'Staff Mobile Number',
                                hintText: '${widget.staff?.dependantPhone}'),
                            BuildRelationshipDropDownList(
                              hints: widget.staff?.relationship,
                              relationship: relationship,
                              onChanged: (value) => setState(() {
                                relationship = value as String;
                              }),
                            ),
                            BuildEmploymentDropDownList(
                              hints: widget.staff?.employmentStatus,
                              employment: employment,
                              onChanged: (value) => setState(() {
                                employment = value as String;
                              }),
                            ),
                            const TextForForm(text: "Employment Date"),
                            CustomDatePicker(
                              date: _employmentDate,
                              hint: widget.staff?.empdateOrDob,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ActionPageButton(
                                onPressed: () async {
                                  await _updateStaff();
                                },
                                text: 'Update Staff'),
                            const SizedBox(
                              height: 30,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
