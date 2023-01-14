import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/textfields_types/buildEmploymentStatus.dart';
import '../../../components/textfields_types/buildStaffRelationshipDropdownList.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/action_page_button2.dart';
import '../../../components/date_text_field.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/textfields_types/zones.dart';
import '../../../components/title.dart';
import '../admin_components/searchableDropDownList_NS.dart';

class VerifyNewStaff extends StatefulWidget {
  ResidentModel? data;

  VerifyNewStaff({Key? key, this.data}) : super(key: key);

  @override
  State<VerifyNewStaff> createState() => _VerifyNewStaffState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _residentMobile = TextEditingController();
TextEditingController _staffName = TextEditingController();
TextEditingController _employmentDate = TextEditingController();
TextEditingController _staffPhone = TextEditingController();
TextEditingController _staffAddress = TextEditingController();

class _VerifyNewStaffState extends State<VerifyNewStaff> {
  String? relationship;
  String? employmentStatus;
  var staff;

  onChange(String? s) async {
    staff = s?.split("- ");
  }

  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Unverified',
    'Declined',
    'Verified',
  ];

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'status',
        style: TextStyle(fontSize: 15),
      ),
      value: status,
      onChanged: (value) => setState(() {
        status = value as String;
      }),
      items: statusOptions.map(buildStatusItem).toList(),
    );
  }

  DropdownMenuItem<String> buildStatusItem(String statusOptions) =>
      DropdownMenuItem(
        value: statusOptions,
        child: Text(
          statusOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

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
                      'Identify Newly Registered Members',
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
                              const TextForForm(
                                text: 'Select Resident',
                              ),
                              SearchableDropDownListForMemberStaff(
                                onChange: onChange,
                                data: widget.data,
                              ),
                              NameTextField(
                                  controller: _residentCode,
                                  hint: 'Resident Code',
                                  nameType: "Resident Code"),
                              MobileNumberTextField(
                                  controller: _staffPhone,
                                  fieldName: "Staff Phone Number",
                                  hintText: 'Staff Phone Number'),
                              NameTextField(
                                  controller: _staffName,
                                  hint: 'Staff Name',
                                  nameType: "Staff Name"),
                              const TextForForm(text: "Employment Date"),
                              CustomDatePicker(date: _employmentDate),

                              BuildEmploymentDropDownList(
                                onChanged: (value) => setState(() {
                                  employmentStatus = value as String;
                                }),
                                employment: employmentStatus,
                              ),
                              BuildRelationshipDropDownList(
                                onChanged: (value) => setState(() {
                                  relationship = value as String;
                                }),
                                relationship: relationship,
                              ),
                              const TextForForm(text: "Identity Status"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffAddress,
                                  hint: 'Staff Address',
                                  nameType: "Staff Contact Details"),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.homePageTheme,
                                    text: 'Verify Staff',
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.decline,
                                    text: 'Decline Verification',
                                  ),
                                ],
                              )
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
