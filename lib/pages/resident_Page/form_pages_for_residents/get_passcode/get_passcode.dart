import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/buildNumOfVisitorsDropDown.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class GetPasscode extends StatefulWidget {
  final data;

  const GetPasscode({Key? key, required this.data}) : super(key: key);

  @override
  State<GetPasscode> createState() => _GetPasscodeState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _visitorName = TextEditingController();

class _GetPasscodeState extends State<GetPasscode> {
  String? noOfVisitors;
  final noOfVisitorsOptions = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  _getPasscode() async {
    if (_email.text.isEmpty) {
      var data = await Services().getPasscode(_mobileNumber, _visitorName,
          widget.data['resident_code'], noOfVisitors, '');
      var message = data['error']['message'];

      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
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
        widget.data['resident_code'],
        noOfVisitors,
        _email.text);
    var message = data['error']['message'];

    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  Widget _buildNoOfVisitors() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose number',
        style: TextStyle(fontSize: 15),
      ),
      value: noOfVisitors,
      onChanged: (value) => setState(() {
        noOfVisitors = value as String;
      }),
      items: noOfVisitorsOptions.map(buildNoOfVisitorsItem).toList(),
    );
  }

  DropdownMenuItem<String> buildNoOfVisitorsItem(String noOfVisitorsOptions) =>
      DropdownMenuItem(
        value: noOfVisitorsOptions,
        child: Text(
          noOfVisitorsOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

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

                              BuildNumberOfEmploymentDropDownList(
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
