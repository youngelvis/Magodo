// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/action_page_button2.dart';
import 'package:magodo/components/textfields_types/zones.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '../../super_admin/super_admin_component/searchableDropDownList_UM.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/date_text_field.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';

class IdentifyNewlyRegisteredMembers extends StatefulWidget {
  ResidentModel? data;

  IdentifyNewlyRegisteredMembers({Key? key, this.data}) : super(key: key);

  @override
  State<IdentifyNewlyRegisteredMembers> createState() =>
      _IdentifyNewlyRegisteredMembersState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _startDate = TextEditingController();
TextEditingController _finishDate = TextEditingController();

class _IdentifyNewlyRegisteredMembersState
    extends State<IdentifyNewlyRegisteredMembers> {
  String? zone;

  var response;
  String? residentcode;

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    residentcode = residentCode?[0];
    final data = await Services().changeResident(residentcode);

    setState(() {
      response = data['data'];
    });
    print(response);
  }

  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Unverified',
    'Declined',
    'Verified',
  ];

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: Text(
        response == null ? statusOptions[0] : response['status'],
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

  callMessage(message) {
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

  verifyNewUser() async {
    var data = await Services().authorizeUser(
      response['resident_reg_code'] ?? '',
      _mobileNumber.text.isEmpty
          ? response['resident_phone']
          : _mobileNumber.text,
      _fullName.text.isEmpty ? response['full_name'] : _fullName.text,
      _startDate.text.isEmpty ? response['validity_starts'] : _startDate.text,
      _finishDate.text.isEmpty ? response['validity_ends'] : _finishDate.text,
      widget.data?.usr_group,
      status ?? response['status'],
    );

    _fullName.clear();
    _address.clear();
    _finishDate.clear();
    _startDate.clear();
    residentcode = null;
    status = null;
    callMessage(data['message']);
  }
  declineNewUser ()async {
    var data = await Services().declineUser(response['resident_reg_code'] ?? '',  widget.data?.usr_group);
    _fullName.clear();
    _address.clear();
    _finishDate.clear();
    _startDate.clear();
    status = null;
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
                  children: [
                    Text(
                      'Identify Newly Registered Members',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextForForm(
                                text: 'Select Resident',
                              ),
                              SearchableDropDownListForFetchMember(
                                onChange: onChange,
                                data: widget.data,
                              ),
                              MobileNumberTextField(
                                controller: _mobileNumber,
                                fieldName: "Mobile Number",
                                hintText: response == null
                                    ? 'Mobile Number'
                                    : response['resident_phone'],
                              ),
                              NameTextField(
                                  controller: _fullName,
                                  hint: response == null
                                      ? 'Full Name'
                                      : response['full_name'],
                                  nameType: "Full Name"),
                              BuildZoneDropDownList(
                                zone: zone,
                                onChanged: (value) => setState(() {
                                  zone = value as String;
                                }),
                                hint: response == null
                                    ? 'Zone'
                                    : response['zone'],
                              ),
                              const TextForForm(text: "Status"),
                              _buildStatus(),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _address,
                                  hint: response == null
                                      ? 'Address'
                                      : response['address'],
                                  nameType: "Address"),
                              const TextForForm(text: "Validity Starts"),
                              CustomDatePicker(
                                date: _startDate,
                                hint: response == null
                                    ? 'Validity Start'
                                    : response['validity_starts'],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Validity Ends"),
                              CustomDatePicker(
                                date: _finishDate,
                                hint: response == null
                                    ? 'Validity End'
                                    : response['validity_ends'],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.verifiedColor,
                                    text: 'Authorize',
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.decline,
                                    text: 'Decline',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
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
