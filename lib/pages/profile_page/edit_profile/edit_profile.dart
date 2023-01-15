import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/resident_type_dropdown_list.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';

import '../../../components/title.dart';

class EditProfile extends StatefulWidget {
  ResidentModel? data;

  EditProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController _firstName = TextEditingController();
TextEditingController _surname = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _mobileNumber = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  String? residentType;

  editProfile() async {
    if (_firstName.text.isEmpty ||
        _surname.text.isEmpty ||
        _mobileNumber.text.isEmpty ||
        _email.text.isEmpty ||
        residentType == null) {
      final data = await Services().updateProfile(
          _firstName.text,
          _surname.text,
          _mobileNumber.text,
          _email.text,
          residentType,
          _address.text,
          widget.data);
      print(data);
    }
    final data = await Services().updateProfile(
        _firstName.text,
        _surname.text,
        _mobileNumber.text,
        _email.text,
        residentType,
        _address.text,
        widget.data);
    print(data);
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
                      'Edit Profile',
                      style: TextStyle(fontSize: 30.sp),
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
                              Center(child: Text(widget.data?.usr_full_name??'', style: TextStyle(fontSize: 20.sp),)),
                              const SizedBox(
                                height: 20,
                              ),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: 'Mobile Number',
                                  hintText: widget.data?.mobile_number??'Enter your mobile number'),
                              NameTextField(
                                  controller: _firstName,
                                  hint: widget.data?.firstname??"Enter First Name",
                                  nameType: "First Name"),
                              NameTextField(
                                  controller: _surname,
                                  hint: widget.data?.surname??"Enter Surname",
                                  nameType: "Surname"),
                              NameTextField(
                                  controller: _email,
                                  hint: widget.data?.email ??"Enter email",
                                  nameType: "Email"),
                              NameTextField(
                                  controller: _address,
                                  hint: "Enter email",
                                  nameType: "Address"),
                              BuildResidentTypeDropDownList(
                                  residentType: residentType,
                                  onChanged: (value) => setState(() {
                                        residentType = value as String;
                                      }),
                              hintText: widget.data?.resident_type??'Select Resident Type'),
                              SizedBox(
                                height: 40.h,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    editProfile();
                                  },
                                  text: 'Update Profile'),
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
