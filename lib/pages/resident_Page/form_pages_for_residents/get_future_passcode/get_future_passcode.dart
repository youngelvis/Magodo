import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:magodo/services/services.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
class GetFuturePasscode extends StatefulWidget {
  final data;

  const GetFuturePasscode({Key? key, required this.data}) : super(key: key);

  @override
  State<GetFuturePasscode> createState() => _GetFuturePasscodeState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _visitorName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _date = TextEditingController();
TextEditingController _arrivalTime = TextEditingController();
TextEditingController _departureTime = TextEditingController();

class _GetFuturePasscodeState extends State<GetFuturePasscode> {
  String? noOfVisitors;
  final noOfVisitorsOptions = ['0', '1', '2', '3', '4', '5', '6'];

  Widget _buildNoOfVisitor() {
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

  _getFuturePasscode() async {
    if (_email.text.isEmpty) {
      var data = await Services().getFuturePasscode(
          _mobileNumber.text,
          _visitorName.text,
          widget.data['resident_code'],
          noOfVisitors,
          '',
          _date.text,
          _arrivalTime.text,
          _departureTime.text);
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
    var data = await Services().getFuturePasscode(
        _mobileNumber.text,
        _visitorName.text,
        widget.data['resident_code'],
        noOfVisitors,
        _email.text,
        _date.text,
        _arrivalTime.text,
        _departureTime.text);
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
                      'Get Future Passcode',
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
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _visitorName,
                                  hint: "Enter visitor's name",
                                  nameType: "Visitor's Name"),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(
                                  text:
                                      "Numbers of person coming with the Visitor"),
                              _buildNoOfVisitor(),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _email,
                                  hint: "Enter email",
                                  nameType: "Email (Optional)"),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Arrival Date"),
                              CustomDatePicker(date: _date),
                              const TextForForm(text: "Arrival Time"),
                              CustomTimePicker(
                                departureTime: _arrivalTime,
                                hint: 'select arrival time',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "DepartureTime"),
                              CustomTimePicker(
                                departureTime: _departureTime,
                                hint: 'select departure time',
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ActionPageButton(
                                  onPressed: () async{
                                    await _getFuturePasscode();
                                  },
                                  text: 'Get Future Passcode'),
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
