import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class AddStaff extends StatefulWidget {
  final data;

  const AddStaff({Key? key, required this.data}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

TextEditingController _residentMobileNumber = TextEditingController();
TextEditingController _staffFullName = TextEditingController();
TextEditingController _staffAddress = TextEditingController();
TextEditingController _staffMobileNumber = TextEditingController();
TextEditingController _employmentDate = TextEditingController();

class _AddStaffState extends State<AddStaff> {
  String? relationship;
  String? employment;

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

  final relationshipOptions = ['House Help', 'Security', 'Driver', 'Personal Assistance','Gardener', 'Others'];

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

  final employmentOptions = [
    'Employed',
    'Resigned',
    'Dismissed',
    'Terminated',
    'Absconded',
    'Family',
    'Others'
  ];

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
  _addStaff() async {

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
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MobileNumberTextField(
                                  controller: _residentMobileNumber,
                                  fieldName: 'Resident Mobile Number',
                                  hintText: 'Enter your mobile number'),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffFullName,
                                  hint: "Enter full name",
                                  nameType: "Staff Full Name"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffAddress,
                                  hint: "Enter staff address",
                                  nameType: "Staff Address"),
                              const SizedBox(
                                height: 20,
                              ),
                              MobileNumberTextField(
                                  controller: _staffMobileNumber,
                                  fieldName: 'Staff Mobile Number',
                                  hintText: 'Enter staff mobile number'),
                              const SizedBox(
                                height: 20,
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
                              const SizedBox(
                                height: 30,
                              ),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Add Staff'),
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
