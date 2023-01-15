import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/zones.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/app_page_theme_action_button.dart';

class AddNewAdministrativeUser extends StatefulWidget {
  ResidentModel? data;

  AddNewAdministrativeUser({Key? key, required this.data}) : super(key: key);

  @override
  State<AddNewAdministrativeUser> createState() =>
      _AddNewAdministrativeUserState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _mobileNumber = TextEditingController();
TextEditingController _surname = TextEditingController();
TextEditingController _firstName = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
TextEditingController _startDate = TextEditingController();
TextEditingController _finishDate = TextEditingController();

class _AddNewAdministrativeUserState extends State<AddNewAdministrativeUser> {
  String? classification;
  final classificationOptions = [
    '-- Select Class --',
    'Security',
    'Admin',
    'Super Admin',
    'Zonal Admin',
    'Zonal Super Admin',
    'Member',
    'Hotel',
    'Schools',
    'Super market',
    'Mosque',
    'Church',
    'Gym House',
    'Hospital',
    'Restaurant',
    'Office',
    'Pharmacy',
    'Saloon/Spa',
    'Others'
  ];
  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Unverified',
    'Declined',
    'Verified',
  ];
  String? zone;

  Widget _buildClassification() {
    return RoundedDropDownTextField(
      hint:  Text(
        '-- Select Class --',
        style: TextStyle(fontSize: 15.sp),
      ),
      value: classification,
      onChanged: (value) => setState(() {
        classification = value as String;
      }),
      items: classificationOptions.map(buildClassificationItem).toList(),
    );
  }

  DropdownMenuItem<String> buildClassificationItem(
          String classificationOptions) =>
      DropdownMenuItem(
        value: classificationOptions,
        child: Text(
          classificationOptions,
          style:  TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint:  Text(
        '-- Select Status --',
        style: TextStyle(fontSize: 15.sp),
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
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );
  callMessage(message){


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
  addNewUser() async{
    if (_residentCode.text.isEmpty ||
        _mobileNumber.text.isEmpty ||
        _surname.text.isEmpty ||
        _firstName.text.isEmpty ||
        _email.text.isEmpty ||
        _address.text.isEmpty ||
        _startDate.text.isEmpty ||
        _finishDate.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        status == null ||
        zone == null) {
      final data = await Services().addNewAdministrativeUser(
          _residentCode.text,
          _mobileNumber.text,
          _surname.text,
          _firstName.text,
          _email.text,
          widget.data!.usr_group,
          status,
          _address.text,
          zone,
          _startDate.text,
          _finishDate.text,
          _password.text,
          _confirmPassword.text);
      callMessage(data["error"]['message']);
    }
    final data = await Services().addNewAdministrativeUser(
        _residentCode.text,
        _mobileNumber.text,
        _surname.text,
        _firstName.text,
        _email.text,
        widget.data!.usr_group,
        status,
        _address.text,
        zone,
        _startDate.text,
        _finishDate.text,
        _password.text,
        _confirmPassword.text);
    callMessage(data['message']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
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
                  children:  [
                    Text(
                      'Add New Administrative User',
                      style: TextStyle(fontSize: 25.sp),
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
                              NameTextField(
                                  controller: _residentCode,
                                  hint: "Enter resident code",
                                  nameType: "Staff Resident Code"),

                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: ' Mobile Number',
                                  hintText: 'Enter mobile number'),

                              NameTextField(
                                  controller: _surname,
                                  hint: "Enter Surname",
                                  nameType: "Surname"),
                              NameTextField(
                                  controller: _firstName,
                                  hint: "Enter First Name",
                                  nameType: " First Name"),
                              NameTextField(
                                  controller: _address,
                                  hint: "Enter address",
                                  nameType: " Address"),
                              NameTextField(
                                  controller: _email,
                                  hint: "Enter email",
                                  nameType: "Email"),

                              NameTextField(
                                  controller: _password,
                                  hint: "Enter a password",
                                  nameType: "Password"),

                              NameTextField(
                                  controller: _confirmPassword,
                                  hint: "Confirm password",
                                  nameType: "Confirm Password"),

                              const TextForForm(text: "Zone"),
                              _buildClassification(),
                              const SizedBox(
                                height: 20,
                              ),
                              BuildZoneDropDownList(
                                zone: zone,
                                onChanged: (value) => setState(() {
                                  zone = value as String;
                                }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Zone"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Starts"),
                              CustomDatePicker(date: _startDate),
                              const TextForForm(text: "Validity Ends"),
                              CustomDatePicker(date: _finishDate),
                              ActionPageButton(
                                  onPressed: () async {
                                    addNewUser();
                                  }, text: 'Create Admin'),
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
