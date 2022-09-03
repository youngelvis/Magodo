import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/components/text_for_form.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:intl/intl.dart';

class GetFuturePasscode extends StatefulWidget {
  const GetFuturePasscode({Key? key}) : super(key: key);

  @override
  State<GetFuturePasscode> createState() => _GetFuturePasscodeState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _visitorName = TextEditingController();
TextEditingController _email = TextEditingController();

class _GetFuturePasscodeState extends State<GetFuturePasscode> {
  String? noOfVisitors;
  final noOfVisitorsOptions = ['0', '1', '2', '3', '4', '5', '6'];

  Widget _buildNoOfVisitor() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Zone',
        style: TextStyle(fontSize: 15),
      ),
      value: noOfVisitors,
      onChanged: (value) =>
          setState(() {
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

  Widget _buildMobileNumber() {
    return RoundedInputField(
      hintText: "Enter Visitor's mobile number",
      controller: _mobileNumber,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9+$]')
                .hasMatch(value!)) {
          return "enter correct mobile Number";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildFirstName() {
    return RoundedTextInputField(
      hintText: 'Enter your visitor name',
      controller: _visitorName,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
          return "enter correct name";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildEmail() {
    return RoundedTextInputField(
      hintText: 'Enter email address',
      controller: _email,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(value!)) {
          return "enter correct email";
        } else {
          return null;
        }
      },
    );
  }

  TextEditingController _date = TextEditingController();



  _buildArrivalDate()  {
    return RoundedTextDateInput(
      hintText: 'mm/dd/yy',
      controller: _date,
      onTap:  () async{
        DateTime? _datePicker = await showDatePicker(context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: color.AppColor.homePageTheme, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: color.AppColor.homePageTheme, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },);
        if(_datePicker !=null ){
          String formattedDate = DateFormat("mm-dd-yyyy").format(_datePicker);
          setState(() {
            _date.text = _datePicker.toString();
            print(_date.toString());
          });

        }else{
          print('select date');
        }
      },
      icon: Icons.calendar_month_rounded,
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only( top: 20,left: 20, right: 20),
            child: Column(

              children: [
                const GetPasscodeTitleContainer(
                  title: 'Get Future Passcode',
                ),
                const SizedBox(
                  height: 50,
                ),

                Expanded(
                  child: OverflowBox(

                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                          Row(
                            children: [
                              const Text(
                                'Get Passcode',
                                style: TextStyle(fontSize: 30),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 15,
                              ),
                            ],
                          ),
                          const TextForForm(text: 'Mobile Number'),
                          _buildMobileNumber(),
                          const TextForForm(text: "Visitor's Name"),
                          _buildFirstName(),
                          const TextForForm(
                              text: "Number of Persons coming with Visitor"),
                          _buildNoOfVisitor(),
                          const TextForForm(text: "Email (optional)"),
                          _buildEmail(),
                          const TextForForm(text: "Arrival Date"),
                          _buildArrivalDate(),
                          ActionPageButton(onPressed: () {}, text: 'Get Passcode')
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
