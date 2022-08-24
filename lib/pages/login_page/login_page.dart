// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/dont_already_have_an_account.dart';
import 'package:magodo/components/roundedInputField.dart';

import 'package:magodo/components/roundedPasswordInput.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/pages/admin_page/admin_page.dart';
import 'package:magodo/pages/central_admin/central_admin.dart';
import 'package:magodo/pages/central_security_admin/central_security_admin.dart';
import 'package:magodo/pages/dependant/dependant.dart';
import 'package:magodo/pages/forget_password_page/forget_Password.dart';
import 'package:magodo/pages/register_page/register_page.dart';
import 'package:magodo/pages/resident_Page/resident_page.dart';
import 'package:magodo/pages/security_page/secruty_page.dart';
import 'package:magodo/pages/super_admin/super_admin.dart';
import 'package:magodo/pages/vas2nets/vas2nets_page.dart';
import 'package:magodo/pages/zonal_admin/zonal_admin.dart';
import 'package:magodo/pages/zonal_super_admin/zonal_super_admin.dart';
import 'package:magodo/services/services.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  _SignINState createState() => _SignINState();
}

TextEditingController _resident_code = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignINState extends State<SignIN> {
  _login() async {
    var data = await Services().login(_resident_code.text, _password.text);

    if (data['data']['usr_group'] == UserGroup.CENTRAL_ADMIN) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CentralAdmin()));
    } else if (data['data']['usr_group'] == UserGroup.CENTRAL_SECURITY_ADMIN) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CentralSecurityAdmin()));
    } else if (data['data']['usr_group'] == UserGroup.MEMBER) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResidentPage()));
    } else if (data['data']['usr_group'] == UserGroup.ADMIN) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Admin()));
    } else if (data['data']['usr_group'] == UserGroup.SECURITY) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SecurityPage()));
    } else if (data['data']['usr_group'] == UserGroup.SUPER_ADMIN) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SuperAdmin()));
    } else if (data['data']['usr_group'] == UserGroup.VAS2NETS) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Vas2Nets_page()));
    } else if (data['data']['usr_group'] == UserGroup.ZONAL_ADMIN) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ZonalAdmin()));
    } else if (data['data']['usr_group'] == UserGroup.ZONAL_SUPER_ADMIN) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ZonalSuperAdmin()));
    } else if (data['data']['usr_group'] == UserGroup.DEPENDANT) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dependant()));
    }
  }

  //varables
  bool isChecked = false;
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  //methods

  Widget _buildResidentCode() {
    return RoundedInputField(
      hintText: 'Enter resident code',
      controller: _resident_code,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return "enter correct resident code";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPassword() {
    return RoundedPasswordField(
      obscureText: _obscureText,
      controller: _password,
      suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              color: color.AppColor.landingPageTitle)),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct password";
        } else {
          return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: color.AppColor.homePageBackground,
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Form(
                key: formKey,
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
                    Text(
                      'resident code',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: color.AppColor.homePageTitle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildResidentCode(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: color.AppColor.homePageTitle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildPassword(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  color.AppColor.homePageTheme),
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: color.AppColor.homePageTheme,
                            checkColor: Colors.white,
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 15, color: Colors.black26),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homeSecondaryTheme),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    ActionPageButton(
                      text: 'Log in',
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          final snackBar = SnackBar(content: _login());
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }

                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
