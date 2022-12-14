import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/buildNumOfVisitorsDropDown.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/sendMessagesButtons/sendMessagesButtons.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class GetPasscode extends StatefulWidget {
  ResidentModel? data;

   GetPasscode({Key? key, required this.data}) : super(key: key);

  @override
  State<GetPasscode> createState() => _GetPasscodeState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _visitorName = TextEditingController();

class _GetPasscodeState extends State<GetPasscode> {
  String? noOfVisitors;

  _getPasscode() async {
    if (_visitorName.text.isEmpty ||
        _visitorName.text.isEmpty ||
        noOfVisitors == null) {
      var data = await Services().getPasscode(_mobileNumber.text,
          _visitorName.text, widget.data?.resident_code, noOfVisitors, '');
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
                  Navigator.of(context).pop();
                },
                child: const Text("ok"))
          ],
        ),
      );
    }
    var data = await Services().getPasscode(
        _mobileNumber.text,
        _visitorName.text,
        widget.data?.resident_code,
        noOfVisitors,
        _email.text);
    var message = data['message'];
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          SendMessagesButtons(data: data, residentCode: widget.data?.resident_code,)
        ],
      ),
    );
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
                GetPasscodeTitleContainer(
                  title: 'Get Passcode',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Generate Passcode(Visitor)',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
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
                                  fieldName: 'Mobile Number',
                                  hintText: 'Enter your mobile number'),
                              NameTextField(
                                  controller: _visitorName,
                                  hint: "Enter your visitor's name",
                                  nameType: "Visitor's name"),
                              NameTextField(
                                  controller: _email,
                                  hint: 'Enter your Email',
                                  nameType: 'Email (Optional)'),
                              BuildNumberOfVisitorsDropDownList(
                                noOfVisitors: noOfVisitors,
                                onChanged: (value) => setState(() {
                                  noOfVisitors = value as String;
                                }),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _getPasscode();
                                  },
                                  text: 'Submit Request'),
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
