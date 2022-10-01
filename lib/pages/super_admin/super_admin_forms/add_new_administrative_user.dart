import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/zones.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';

import '../../../components/app_page_theme_action_button.dart';
class AddNewAdministrativeUser extends StatefulWidget {
  final data;
  const AddNewAdministrativeUser({Key? key, required this.data}) : super(key: key);

  @override
  State<AddNewAdministrativeUser> createState() => _AddNewAdministrativeUserState();
}
TextEditingController _residentCode = TextEditingController();
TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
TextEditingController _startDate = TextEditingController();
TextEditingController _finishDate = TextEditingController();
class _AddNewAdministrativeUserState extends State<AddNewAdministrativeUser> {
  String? classification;
  final classificationOptions = ['0', '1', '2', '3', '4', '5', '6'];
  String? status;
  final statusOptions = ['0', '1', '2', '3', '4', '5', '6'];
  String? zone;
  final zoneOptions = [
    Zones.AEA,
    Zones.AGBOOLA_AJUMOBI,
    Zones.AKIN_TIJANI,
    Zones.BASHEER_SHITTU,
    Zones.BROADWAY,
    Zones.CENTRAL,
    Zones.FAA,
    Zones.FILLING_EGDE,
    Zones.FORESHORE,
    Zones.GORGE_VIEW,
    Zones.KAYODE_TAIWO,
    Zones.KOLA_AMODU,
    Zones.MAINLINE,
    Zones.NELSON_NWEKE,
    Zones.OGUNYE,
    Zones.PALM_VIEW,
    Zones.PEACE_VALLEY,
    Zones.PSSDC_WALE_TAIWO,
    Zones.SOUTH_EAST,
    Zones.SOUTH_WEST,
    Zones.VALLEY_VIEW
  ];
  Widget _buildZone() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select Zone',
        style: TextStyle(fontSize: 15),
      ),
      value: zone,
      onChanged: (value) => setState(() {
        zone = value as String;
      }),
      items: zoneOptions.map(buildZoneItem).toList(),
    );
  }

  DropdownMenuItem<String> buildZoneItem(String zoneOptions) =>
      DropdownMenuItem(
        value: zoneOptions,
        child: Text(
          zoneOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  Widget _buildClassification() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose number',
        style: TextStyle(fontSize: 15),
      ),
      value: classification,
      onChanged: (value) => setState(() {
        classification = value as String;
      }),
      items: classificationOptions.map(buildClassificationItem).toList(),
    );
  }

  DropdownMenuItem<String> buildClassificationItem(String classificationOptions) =>
      DropdownMenuItem(
        value: classificationOptions,
        child: Text(
          classificationOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );


  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose number',
        style: TextStyle(fontSize: 15),
      ),
      value: status,
      onChanged: (value) => setState(() {
        status = value as String;
      }),
      items: statusOptions.map(buildStatusItem).toList(),
    );
  }

  DropdownMenuItem<String> buildStatusItem(String statusOptions) =>
      DropdownMenuItem(
        value: statusOptions,
        child: Text(
          statusOptions,
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
                      'Add New Administrative User',
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
                              NameTextField(
                                  controller: _residentCode,
                                  hint: "Enter resident code",
                                  nameType: "Staff Resident Code"),
                              const SizedBox(
                                height: 20,
                              ),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: ' Mobile Number',
                                  hintText: 'Enter mobile number'),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _fullName,
                                  hint: "Enter full name",
                                  nameType: "Staff Full Name"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _address,
                                  hint: "Enter address",
                                  nameType: " Email"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _email,
                                  hint: "Enter email",
                                  nameType: "Email"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _password,
                                  hint: "Enter a password",
                                  nameType: "Password"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _confirmPassword,
                                  hint: "Confirm password",
                                  nameType: "Confirm Password"),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Zone"),
                              _buildClassification(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Zone"),
                              _buildZone(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Zone"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Starts"),
                              CustomDatePicker(date: _startDate),
                              const TextForForm(text: "Validity Ends"),
                              CustomDatePicker(date: _finishDate),
                              ActionPageButton(
                                  onPressed: () async{
                                  }, text: 'Create Admin'),
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
