import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:magodo/pages/login_page2/TextPage.dart';
import 'package:magodo/services/services.dart';

import '../../components/app_page_theme_action_button.dart';
import '../../components/dont_already_have_an_account.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/remember_me.dart';
import '../../components/textfields_types/name_textfield.dart';
import '../../components/textfields_types/password_textfield.dart';
import '../register_page/register_page.dart';
class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}
TextEditingController _residentCode = TextEditingController();
TextEditingController _password = TextEditingController();
class _LoginPage2State extends State<LoginPage2> {
  var sessionManager = SessionManager();

  _login() async {
    var data = await Services().login(_residentCode.text, _password.text);
    await sessionManager.set("id", 3);
    Navigator.push(context, MaterialPageRoute(builder:(context)=> const TestPage()));
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
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
