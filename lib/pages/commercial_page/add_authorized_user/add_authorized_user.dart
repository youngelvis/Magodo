import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';

import '../../../components/app_page_theme_action_button.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/textfields_types/password_textfield.dart';
import '../../../components/title.dart';

class AddAuthorizedUser extends StatefulWidget {
  ResidentModel? data;

  AddAuthorizedUser({Key? key, this.data}) : super(key: key);

  @override
  State<AddAuthorizedUser> createState() => _AddAuthorizedUserState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _AddAuthorizedUserState extends State<AddAuthorizedUser> {
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
                children: [
                  Text(
                    'Add Authorized User',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                          MobileNumberTextField(
                              controller: _mobileNumber,
                              fieldName: ' Mobile Number',
                              hintText: ' mobile number'),
                          NameTextField(
                              controller: _fullName,
                              hint: "Enter  Full name",
                              nameType: "Full Name"),
                          NameTextField(
                              controller: _email,
                              hint: "Enter  Email",
                              nameType: "Email"),
                          BuildPasswordTextField(
                              fieldName: 'Password', passwordController: _password),
                          BuildPasswordTextField(
                              fieldName: 'Confirm Password', passwordController: _confirmPassword),
                          SizedBox(
                            height: 30.h,
                          ),
                          ActionPageButton(
                              onPressed: () async {

                              },
                              text: 'Add Authorized User'),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
