import 'package:flutter/material.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';

import '../../../components/app_page_theme_action_button.dart';
import '../../../components/components_for_class_of_varable/zones.dart';
import '../../../components/date_text_field.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';

class UpdateMember extends StatefulWidget {
  final data;

  const UpdateMember({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdateMember> createState() => _UpdateMemberState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _firstName = TextEditingController();
TextEditingController _surname = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _startDate = TextEditingController();
TextEditingController _finishDate = TextEditingController();

class _UpdateMemberState extends State<UpdateMember> {
  String? classification;
  final classificationOptions = [
    '-- Select Class --',
    'Security',
    'Admin',
    'Super Admin',
    'Zonal Admin',
    'Zonal Super Admin',
    'Member',
    'Hotel',
    'Schools',
    'Super market',
    'Mosque',
    'Church',
    'Gym House',
    'Hospital',
    'Restaurant',
    'Office',
    'Pharmacy',
    'Saloon/Spa',
    'Others'
  ];
  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Unverified',
    'Declined',
    'Verified',
  ];
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

  DropdownMenuItem<String> buildClassificationItem(
          String classificationOptions) =>
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
                      'Update Member',
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
                                  controller: _firstName,
                                  hint: "Enter full name",
                                  nameType: "first Name"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _surname,
                                  hint: "Enter surname",
                                  nameType: "surName"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: ' Mobile Number',
                                  hintText: 'Enter mobile number'),
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
                              const TextForForm(text: "Status"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Zone"),
                              _buildZone(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Classification"),
                              _buildClassification(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Starts"),
                              CustomDatePicker(date: _startDate),
                              const TextForForm(text: "Validity Ends"),
                              CustomDatePicker(date: _finishDate),
                              ActionPageButton(
                                  onPressed: () async {}, text: 'Update'),
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
