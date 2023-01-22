import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/resident_type_dropdown_list.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/profile_page/edit_profile/commercialEditProfile.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
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
TextEditingController _businessAddress = TextEditingController();
TextEditingController _businessName = TextEditingController();
TextEditingController _businessEmail = TextEditingController();
TextEditingController _staffNumber = TextEditingController();
TextEditingController _businessMobileNumber = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  String? residentType;
  String? category;

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

  editProfile() async {
    if (widget.data?.resident_type == "Resident") {
      final data = await Services().updateResidentProfile(
          _firstName.text.isEmpty ? widget.data?.firstname : _firstName.text,
          _surname.text.isEmpty ? widget.data?.surname : _surname.text,
          _mobileNumber.text.isEmpty ? widget.data?.msisdn : _mobileNumber.text,
          _email.text.isEmpty ? widget.data?.email : _email.text,
          residentType ?? widget.data?.resident_type,
          _address.text.isEmpty ? widget.data?.address : _address.text,
          widget.data);
      callMessage(data['message']);
    }
    final data = await Services().updateCommercialProfile(
      _firstName.text.isEmpty ? widget.data?.firstname : _firstName.text,
      _surname.text.isEmpty ? widget.data?.surname : _surname.text,
      _mobileNumber.text.isEmpty ? widget.data?.msisdn : _mobileNumber.text,
      _email.text.isEmpty ? widget.data?.email : _email.text,
      residentType ?? widget.data?.resident_type,
      _address.text.isEmpty ? widget.data?.address : _address.text,
      widget.data,
      _businessAddress.text.isEmpty
          ? widget.data?.street_address
          : _businessAddress.text,
      _businessName.text.isEmpty
          ? widget.data?.Business_name
          : _businessName.text,
      _staffNumber.text,
      _businessMobileNumber.text.isEmpty
          ? widget.data?.mobile_number
          : _businessMobileNumber.text,
      _businessEmail.text.isEmpty
          ? widget.data?.business_email
          : _businessEmail.text,
    );
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
                              const SizedBox(
                                height: 20,
                              ),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: 'Mobile Number',
                                  hintText: widget.data?.msisdn ??
                                      'Enter your mobile number'),
                              NameTextField(
                                  controller: _firstName,
                                  hint: widget.data?.firstname ??
                                      "Enter First Name",
                                  nameType: "First Name"),
                              NameTextField(
                                  controller: _surname,
                                  hint: widget.data?.surname ?? "Enter Surname",
                                  nameType: "Surname"),
                              NameTextField(
                                  controller: _email,
                                  hint: widget.data?.email ?? "Enter email",
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
                                  hintText: widget.data?.resident_type ??
                                      'Select Resident Type'),
                              widget.data?.resident_type == 'Commercial'
                                  ? CommercialEditProfile(
                                      businessName: _businessName,
                                      businessAddress: _businessAddress,
                                      businessEmail: _businessEmail,
                                      businessMobileNumber:
                                          _businessMobileNumber,
                                      staffNumber: _staffNumber,
                                      data: widget.data,
                                      category: category,
                                      onChange: (value) => setState(() {
                                        category = value as String;
                                      }),
                                    )
                                  : const Text(''),
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
