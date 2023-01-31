import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '/../../../components/app_page_theme_action_button.dart';
import '/../../../components/textfields_types/mobile_num_textfield.dart';
import '/../../../components/textfields_types/name_textfield.dart';
import '/../../../components/title.dart';

class RegisterParent extends StatefulWidget {
  ResidentModel? data;

  RegisterParent({Key? key, this.data}) : super(key: key);

  @override
  State<RegisterParent> createState() => _RegisterParentState();
}

TextEditingController _parentFullName = TextEditingController();
TextEditingController _parentMobile = TextEditingController();
TextEditingController _parentEmail = TextEditingController();
TextEditingController _parentAddress = TextEditingController();

class _RegisterParentState extends State<RegisterParent> {
  callMessage(message) {
    return showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
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

  _registerParent() async {
    if (_parentAddress.text.isEmpty || _parentMobile.text.isEmpty ||
        _parentAddress.text.isEmpty) {
      var data = await Services().addParent(
          widget.data?.resident_code,
          widget.data?.zone,
          _parentEmail.text,
          widget.data?.usr_full_name,
          widget.data?.msisdn,
          _parentFullName.text,
          widget.data?.business_name,
          _parentAddress.text,
          _parentMobile.text);
      callMessage(data['error']['message']);
    }
    var data = await Services().addParent(
        widget.data?.resident_code,
        widget.data?.zone,
        _parentEmail.text,
        widget.data?.usr_full_name,
        widget.data?.msisdn,
        _parentFullName.text,
        widget.data?.business_name,
        _parentAddress.text,
        _parentMobile.text);

    _parentEmail.clear();
    _parentFullName.clear();
    _parentAddress.clear();
    _parentMobile.clear();
    callMessage(data['message']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 20.h, ),
          child: Column(
            children: [
              SizedBox(
                width: 25.w,
              ),
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
                    'Register Parent',
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
                      child: Container(
                        padding:  EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NameTextField(
                                controller: _parentFullName,
                                hint: "Enter Parent Full name",
                                nameType: "Full Name"),
                            MobileNumberTextField(
                                controller: _parentMobile,
                                fieldName: ' Parent Mobile Number',
                                hintText: 'parent mobile number'),
                            NameTextField(
                                controller: _parentEmail,
                                hint: "Enter Parent Email",
                                nameType: "Email (optional)"),
                            NameTextField(
                                controller: _parentAddress,
                                hint: "Enter Parent Address",
                                nameType: "Parent Address"),
                            SizedBox(
                              height: 30.h,
                            ),
                            ActionPageButton(
                                onPressed: () async {
                                  _registerParent();
                                },
                                text: 'Register Parent'),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
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
