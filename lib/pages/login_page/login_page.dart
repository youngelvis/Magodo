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
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';

import 'package:magodo/pages/super_admin/super_admin_forms/add_new_administrative_user.dart';

import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/terms_and_conditions.dart';
import '../admin_page/admin_forms/identify_newly_registered_members.dart';
import '../commercial_page/commercial_reports/commercial_event_request/commercial_event_records.dart';
import '../landing_page/welcome_screen.dart';
import '../security_page/security_form/validate_passcode.dart';
import '../settings_page/web_view.dart';

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignINState createState() => _SignINState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignINState extends State<SignIN> {
  bool isChecked = false;
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
              _residentCode.clear();
              _password.clear();
              Navigator.of(context).pop();
            },
            child: const Text("ok"))
      ],
    ),
  );
}
  callMessage3() {
    return showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: Text("Please accept our Privacy Policy be you can Sign in"),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: color.AppColor.landingPage2, backgroundColor: color.AppColor.homePageTheme,
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

  _login() async {
    if(isChecked == false){
      callMessage3();
      return;
    }
    if (_residentCode.text.isEmpty && _password.text.isEmpty) {
      var data = await Services().login(_residentCode.text, _password.text);
      var message = data['error']['message'];

      callMessage(message);
      return;
    }
    if (_residentCode.text.isEmpty ) {
      var data = await Services().login(_residentCode.text, _password.text);
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    if(_password.text.isEmpty){
      var data = await Services().login(_residentCode.text, _password.text);
      var message = data['message'];
      callMessage(message);
      return;
    }
    var data = await Services().login(_residentCode.text, _password.text);
    print(data);
    if (data['code'] == 200) {
      setState(() {
        mainResidentModel = MainResidentModel.fromJson(data);
      });
      final resident = mainResidentModel.data;

      if (resident?.usr_group == UserGroup.MEMBER ||resident?.usr_group == UserGroup.DEPENDANT) {
        _navigation(
          GetPasscode(
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
      }
    }else {
      var message = data['message'];

     callMessage(message);
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: color.AppColor.homePageBackground,
                padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
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
                        hint: 'Resident code',
                        nameType: 'Resident Code'),
                    BuildPasswordTextField(
                        fieldName: 'Password', passwordController: _password),
                    SizedBox(
                      height: 20.h,
                    ),
                    const RememberMe(),
                    SizedBox(
                      height: 50.h,
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

                    TermsAndConditions(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    InkWell(
                      onTap:() { Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));},
                      child: Row(
                        children: [
                         Icon(Icons.home_outlined , size: 25,color: color.AppColor.homeSecondaryTheme ,),
                          Text('Home', style: TextStyle( fontWeight: FontWeight.bold,
                          color: color.AppColor.homeSecondaryTheme ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
