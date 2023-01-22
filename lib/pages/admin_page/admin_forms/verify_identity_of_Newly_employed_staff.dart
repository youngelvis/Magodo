import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '../../../api/api.dart';
import '../../../components/components_for_class_of_varable/userGroup.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/textfields_types/buildEmploymentStatus.dart';
import '../../../components/textfields_types/buildStaffRelationshipDropdownList.dart';
import '../../../models/fetch_staff_model/fetch_staff_model.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/action_page_button2.dart';
import '../../../components/date_text_field.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';

class VerifyNewStaff extends StatefulWidget {
  ResidentModel? data;

  VerifyNewStaff({Key? key, this.data}) : super(key: key);

  @override
  State<VerifyNewStaff> createState() => _VerifyNewStaffState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _staffName = TextEditingController();
TextEditingController _employmentDate = TextEditingController();
TextEditingController _staffPhone = TextEditingController();
TextEditingController _staffAddress = TextEditingController();

class _VerifyNewStaffState extends State<VerifyNewStaff> {
  String? relationship;
  String? employmentStatus;
  var staffGUID;
  var response;
  FetchStaffs? fetchStaffs;

  @override
  // ignore: must_call_super
  initState() {
    getData();
  }

  var sessionManager = SessionManager();

  void getData() async {
    var userGroup = widget.data?.usr_group;
    var zone = widget.data?.zone;
    String url = '';

    if (userGroup == UserGroup.SUPER_ADMIN || userGroup == UserGroup.ADMIN) {
      url = 'fetchEmployedStaffs';
    }
    url = 'fetchEmployedStaffs/$zone';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);

    setState(() {
      fetchStaffs = FetchStaffs.fromJson(r);
    });
  }

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    String? name = residentCode?[1];

    for (FetchStaff item in fetchStaffs?.data ?? []) {
      if (item.dependantName == name?.trim()) {
        setState(() {
          staffGUID = item.guid;
        });
      }
    }
    final data = await Services().changeStaff(staffGUID);

    setState(() {
      response = data['data'];
    });
    print(response);
  }

  _buildSearchableDropDownList() {
    return Column(
      children: [
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItems: true,
          items: fetchStaffs?.data
              ?.map((e) => "${e.residentCode} - ${e.dependantName}")
              .toList(),
          dropdownSearchDecoration:
              const InputDecoration(hintText: "select staff"),
          showSearchBox: true,
          onChanged: onChange,
          searchFieldProps: const TextFieldProps(
            cursorColor: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
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
      hint: Text(
        response == null ? 'Staff Name' : response['status'],
        style: const TextStyle(fontSize: 15),
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

  callMessage(message) {
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

  verifyNewStaff() async {
    var data =
        await Services().verifyStaff(staffGUID, status, widget.data?.usr_group);
    _residentCode.clear();
    _staffName.clear();
    _employmentDate.clear();
    _staffAddress.clear();
    _staffPhone.clear();
    callMessage(data['message']);
  }

  declineNewStaff() async {
    var data = await Services().declineUser(staffGUID, widget.data?.usr_group);
    _residentCode.clear();
    _staffName.clear();
    _employmentDate.clear();
    _staffAddress.clear();
    _staffPhone.clear();
    callMessage(data['message']);
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
                  children: [
                    Text(
                      'Identify Newly Employed Staff',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
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
                              _buildSearchableDropDownList(),
                              NameTextField(
                                  controller: _residentCode,
                                  hint: response == null
                                      ? 'Staff Name'
                                      : response['resident_code'],
                                  nameType: "Resident Code"),
                              MobileNumberTextField(
                                controller: _staffPhone,
                                fieldName: "Staff Phone Number",
                                hintText: response == null
                                    ? 'Staff Name'
                                    : response['staff_msisdn'],
                              ),
                              NameTextField(
                                  controller: _staffName,
                                  hint: response == null
                                      ? 'Staff Name'
                                      : response['staff_name'],
                                  nameType: "Staff Name"),
                              const TextForForm(
                                text: "Employment Date",
                              ),
                              CustomDatePicker(
                                date: _employmentDate,
                                hint: response == null
                                    ? 'Employment date'
                                    : response['employment_date'],
                              ),
                              BuildEmploymentDropDownList(
                                onChanged: (value) => setState(() {
                                  employmentStatus = value as String;
                                }),
                                employment: employmentStatus,
                                hints: response == null
                                    ? 'Employment Status'
                                    : response['employment_status'],
                              ),
                              BuildRelationshipDropDownList(
                                onChanged: (value) => setState(() {
                                  relationship = value as String;
                                }),
                                relationship: relationship,
                                hints: response == null
                                    ? 'Relationship'
                                    : response['relationship'],
                              ),
                              const TextForForm(text: "Identity Status"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffAddress,
                                  hint: response == null
                                      ? 'Staff Address'
                                      : response['staff_contact'],
                                  nameType: "Staff Contact Details"),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
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
                                    text: 'Decline staff',
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
