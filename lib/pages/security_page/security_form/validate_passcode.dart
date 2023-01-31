import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
class ValidatePasscode extends StatefulWidget {
  ResidentModel? data;

  ValidatePasscode({Key? key, this.data}) : super(key: key);

  @override
  State<ValidatePasscode> createState() => _ValidatePasscodeState();
}

TextEditingController _passcode = TextEditingController();

class _ValidatePasscodeState extends State<ValidatePasscode> {
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
  validatePasscode()async{
    if(_passcode.text.isEmpty){
      var result = await Services().validatePasscode(_passcode.text, widget.data?.usr_group);
      callMessage(result['error']["message"]);
      return;
    }
    final data = await Services().validatePasscode(_passcode.text, widget.data?.usr_group);
    callMessage(data["message"]);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 20.h),
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
                  children:  [
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'Validate Passcode',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                          padding:  EdgeInsets.only( left: 25.w, right: 25.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NameTextField(
                                    controller: _passcode,
                                    hint: "Passcode",
                                    nameType: "Enter Passcode"),
                                const SizedBox(
                                  height: 100,
                                ),
                                ActionPageButton(
                                    onPressed: () {
                                      validatePasscode();
                                    },
                                     text: 'Validate Passcode'),
                                const SizedBox(
                                  height: 50,
                                ),
                              ]),
                        ),
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
