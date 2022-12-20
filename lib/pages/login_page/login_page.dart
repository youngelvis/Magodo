// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
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
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/add_new_administrative_user.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignINState createState() => _SignINState();
}

TextEditingController _residentCode = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignINState extends State<SignIN> {
  MainResidentModel mainResidentModel = MainResidentModel();
  MainErrorHandler mainErrorHandler = MainErrorHandler();
  WrongDetailsResident wrongDetailsResident = WrongDetailsResident();
  bool login = false;

  void _navigation(data) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => data));
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

    if (data['data'] != []) {
      setState(() {
        mainResidentModel = MainResidentModel.fromJson(data);
      });
      final resident = mainResidentModel.data;

      if (resident?.usr_group == UserGroup.MEMBER) {
        _navigation(
          ResidentPageLandingPage(
            data: resident,
          ),
        );
      } else if (data['data']['usr_group'] == UserGroup.SUPER_ADMIN) {
        _navigation(
          AddNewAdministrativeUser(
            data: resident,
          ),
        );
      }
    } else {
      setState(() {
        wrongDetailsResident = WrongDetailsResident.fromJson(data);
      });
      var message = wrongDetailsResident.message;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: color.AppColor.homePageBackground,
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: color.AppColor.landingPageTitle,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: color.AppColor.homeSecondaryTheme,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(child: DontAlreadyHaveAnAccount(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  NameTextField(
                      controller: _residentCode,
                      hint: 'resident code',
                      nameType: 'Resident Code'),
                  BuildPasswordTextField(
                      fieldName: 'Password', passwordController: _password),
                  const SizedBox(
                    height: 20,
                  ),
                  const RememberMe(),
                  const SizedBox(
                    height: 200,
                  ),
                  ActionPageButton(
                    text: 'Log in',
                    onPressed: () async {
                      await _login();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
