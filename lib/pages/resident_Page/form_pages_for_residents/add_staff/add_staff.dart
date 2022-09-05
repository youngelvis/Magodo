import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/roundedInputField.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
import 'package:magodo/components/roundedTextInputField.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}
TextEditingController _residentCode = TextEditingController();
TextEditingController _residentMobileNumber = TextEditingController();
TextEditingController _staffFullName = TextEditingController();
TextEditingController _staffAddress = TextEditingController();
TextEditingController _staffMobileNumber = TextEditingController();
TextEditingController _employmentDate = TextEditingController();
class _AddStaffState extends State<AddStaff> {

  Widget _buildResidentCode() {
    return RoundedInputField(
      hintText: 'Enter resident code',
      controller: _residentCode,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return "enter correct resident code";
        } else {
          return null;
        }
      },
    );
  }
  Widget _buildResidentMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter your mobile number',
      controller: _residentMobileNumber,
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
  Widget _buildStaffFullName() {
    return RoundedTextInputField(
      hintText: 'Enter your firstname',
      controller: _staffFullName,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
          return "enter correct Firstname";
        } else {
          return null;
        }
      },
    );
  }
  Widget _buildStaffAddress() {
    return RoundedTextInputField(
      hintText: 'Enter your address',
      controller: _staffAddress,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
          return "enter correct address";
        } else {
          return null;
        }
      },
    );
  }
  Widget _buildStaffMobileNumber() {
    return RoundedInputField(
      hintText: 'Enter your mobile number',
      controller: _staffMobileNumber,
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
  _buildArrivalDate() {
    return RoundedTextDateInput(
      hintText: 'mm/dd/yy',
      controller: _employmentDate,
      onTap: () async {
        DateTime? _datePicker = await showDatePicker(
          context: context,
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
          },
        );
        if (_datePicker != null) {
          String formattedDate = DateFormat("MM/dd/yyyy").format(_datePicker);
          setState(() {
            _employmentDate.text = formattedDate.toString();
          });
        } else {
          print('select date');
        }
      },
      icon: Icons.calendar_month_rounded,
    );
  }

  String? relationship;
  final relationshipOptions = ['1', '2'];
  Widget _buildRelationship() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select relationship',
        style: TextStyle(fontSize: 15),
      ),
      value: relationship,
      onChanged: (value) => setState(() {
        relationship = value as String;
      }),
      items: relationshipOptions.map(buildRelationshipItem).toList(),
    );
  }

  DropdownMenuItem<String> buildRelationshipItem(String relationshipOptions) =>
      DropdownMenuItem(
        value: relationshipOptions,
        child: Text(
          relationshipOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  String? employment;
  final employmentOptions = ['1', '2'];
  Widget _buildEmploymentStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select employment',
        style: TextStyle(fontSize: 15),
      ),
      value: employment,
      onChanged: (value) => setState(() {
        employment = value as String;
      }),
      items: employmentOptions.map(buildEmploymentItem).toList(),
    );
  }

  DropdownMenuItem<String> buildEmploymentItem(String employmentOptions) =>
      DropdownMenuItem(
        value: employmentOptions,
        child: Text(
          employmentOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                const TitleContainer(
                  title: 'Dashboard',
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Add Staff',
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
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextForForm(text: 'Enter resident code'),
                              _buildResidentCode(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Resident Mobile Number"),
                              _buildResidentMobileNumber(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(
                                  text:
                                  "Staff Full Name"),
                              _buildStaffFullName(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Staff Address"),
                              _buildStaffAddress(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Staff Mobile Number"),
                              _buildStaffMobileNumber(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Relationship"),
                              _buildRelationship(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Employment Status"),
                              _buildEmploymentStatus(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Employment Date"),
                              _buildArrivalDate(),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Get Passcode'),
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
