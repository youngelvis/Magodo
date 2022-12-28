import 'package:flutter/material.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/zones.dart';
import 'package:magodo/pages/super_admin/super_admin_component/searchableDropDownList_UM.dart';
import 'package:magodo/services/services.dart';
import '../../../components/app_page_theme_action_button.dart';
import '../../../components/date_text_field.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';
import '../../../models/resident_data_model/residentdata.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
class UpdateMember extends StatefulWidget {
  ResidentModel? data;

  UpdateMember({Key? key, required this.data}) : super(key: key);

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
  String? residentcode;
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

  Widget _buildClassification() {
    return RoundedDropDownTextField(
      hint: Text(
        response['user_group'],
        style: const TextStyle(fontSize: 15),
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
      hint: Text(
        response['status'],
        style: const TextStyle(fontSize: 15),
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
  var response;

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    residentcode = residentCode?[0];
    final data = await Services().changeResident(residentcode);
    response = data['data'];
    setState(() {});
  }
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
  updateMember() async {
    final data = await Services().updateMember(
        widget.data?.resident_code,
        _mobileNumber.text.isEmpty
            ? response['resident_phone']
            : _mobileNumber.text,
        _firstName.text.isEmpty ? response['firstname'] : _firstName.text,
        _surname.text.isEmpty ? response['surname'] : _surname.text,
        _email.text.isEmpty ? response['email'] : _email.text,
        response['user_group'],
        status ?? response['status'],
        _address.text.isEmpty ? response['address'] : _address.text,
        zone ?? response['zone'],
        _startDate.text.isEmpty ? response['validity_starts'] : _startDate.text,
        _finishDate.text.isEmpty
            ? response['validity_ends']
            : _finishDate.text);
    print(data);
    callMessage(data['message']);
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
                              SearchableDropDownList1(onChange: onChange),
                              NameTextField(
                                  controller: _firstName,
                                  hint: response['firstname'],
                                  nameType: "First Name"),
                              NameTextField(
                                  controller: _surname,
                                  hint: response['surname'],
                                  nameType: "Surname"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: "Mobile Number",
                                  hintText: response['resident_phone']),
                              NameTextField(
                                  controller: _email,
                                  hint: response['email'],
                                  nameType: " Email"),
                              NameTextField(
                                  controller: _address,
                                  hint: response['address'],
                                  nameType: "Address"),
                              const TextForForm(text: "Status"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              BuildZoneDropDownList(
                                zone: zone,
                                hint: response['zone'],
                                onChanged: (value) => setState(() {
                                  zone = value as String;
                                }),
                              ),
                              const TextForForm(text: "Classification"),
                              _buildClassification(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Starts"),
                              CustomDatePicker(
                                date: _startDate,
                                hint: response['validity_starts'],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Ends"),
                              CustomDatePicker(
                                  date: _finishDate,
                                  hint: response['validity_ends']),
                              const SizedBox(
                                height: 20,
                              ),
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
