// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/remember_me.dart';
import 'package:magodo/components/dont_already_have_an_account.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/password_textfield.dart';
import 'package:magodo/models/resident_data_model/mainErrorHandler.dart';
import 'package:magodo/models/resident_data_model/mainResidentModel.dart';
import 'package:magodo/models/resident_data_model/wrongDetailsResident.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/event_request/event_request.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';

import 'package:magodo/pages/super_admin/super_admin_forms/add_new_administrative_user.dart';

import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../admin_page/admin_forms/identify_newly_registered_members.dart';
import '../commercial_page/commercial_reports/commercial_event_request/commercial_event_records.dart';
import '../security_page/security_form/validate_passcode.dart';

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignINState createState() => _SignINState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignINState extends State<SignIN> {
  List commercial_category = [
    "Church",
    "Mosque",
    "Supermarket",
    "Gym House",
    "Pharmacy",
    "Office",
    "Hospital",
    "Restaurant",
    "Saloon/Spa",
    "Entertainment",
    "Hotel",
    "School",
    "Others"
  ];
  MainResidentModel mainResidentModel = MainResidentModel();
  MainErrorHandler mainErrorHandler = MainErrorHandler();
  WrongDetailsResident wrongDetailsResident = WrongDetailsResident();
  bool login = false;

  void _navigation(data) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => data));
    _residentCode.clear();
    _password.clear();
  }
callMessage(){

}
  _login() async {
    if (_residentCode.text.isEmpty || _password.text.isEmpty) {
      var data = await Services().login(_residentCode.text, _password.text);
      print(data['error']['message']);
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
                  _residentCode.clear();
                  _password.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
    var data = await Services().login(_residentCode.text, _password.text);

    if (data['code'] == 200) {
      setState(() {
        mainResidentModel = MainResidentModel.fromJson(data);
      });
      final resident = mainResidentModel.data;

      if (resident?.usr_group == UserGroup.MEMBER) {
        _navigation(
          ViewPasscodeReport(
            data: resident,
          ),
        );
      } else if (data['data']['usr_group'] == UserGroup.SUPER_ADMIN ||
          data['data']['usr_group'] == UserGroup.ZONAL_SUPER_ADMIN) {
        _navigation(AddNewAdministrativeUser(data: resident));
      } else if (data['data']['usr_group'] == UserGroup.SECURITY) {
        _navigation(ValidatePasscode(data: resident));
      } else if (data['data']['usr_group'] == UserGroup.ADMIN ||
          data['data']['usr_group'] == UserGroup.ZONAL_ADMIN) {
        _navigation(IdentifyNewlyRegisteredMembers(data: resident));
      } else if (commercial_category.contains(data['data']['usr_group']) ) {
        _navigation(EventRequest(data: resident));
      } else {
        var message = data['error'];

        return showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(message!),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: color.AppColor.homePageTheme,
                      onPrimary: color.AppColor.landingPage2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    _residentCode.clear();
                    _password.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("ok"))
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: color.AppColor.homePageBackground,
              padding: EdgeInsets.only(top: 60.h, left: 30.w, right: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: color.AppColor.landingPageTitle,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: color.AppColor.homeSecondaryTheme,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(child: DontAlreadyHaveAnAccount(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                  )),
                  SizedBox(
                    height: 40.h,
                  ),
                  NameTextField(
                      controller: _residentCode,
                      hint: 'resident code',
                      nameType: 'Resident Code'),
                  BuildPasswordTextField(
                      fieldName: 'Password', passwordController: _password),
                  SizedBox(
                    height: 20.h,
                  ),
                  const RememberMe(),
                  SizedBox(
                    height: 120.h,
                  ),
                  ActionPageButton(
                    text: 'Log in',
                    onPressed: () async {
                      await _login();
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
