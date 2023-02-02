import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/zones.dart';
import 'package:magodo/pages/super_admin/super_admin_component/searchableDropDownList_UM.dart';
import 'package:magodo/services/services.dart';
import '../../../components/app_page_theme_action_button.dart';
import '../../../components/components_for_class_of_varable/userGroup.dart';
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
        response == null ? classificationOptions[0] : response['user_group'],
        style: TextStyle(fontSize: 15.sp),
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
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: Text(
        response == null ? statusOptions[0] : response['status'],
        style: TextStyle(fontSize: 15.sp),
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
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );
  var response;

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    residentcode = residentCode?[0];
    final data = await Services().changeResident(residentcode);

    setState(() {
      response = data['data'];
    });
  }

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

  updateMember() async {
    classification == 'Super Admin'
        ? classification = UserGroup.SUPER_ADMIN
        : classification == 'Zonal Admin'
        ? classification = UserGroup.ZONAL_ADMIN
        : classification == 'Zonal Super Admin'
        ? classification = UserGroup.ZONAL_SUPER_ADMIN
        :classification;
    final data = await Services().updateResidentMember(
        response['resident_reg_code'] ?? '',
        _mobileNumber.text.isEmpty
            ? response['resident_phone']
            : _mobileNumber.text,
        _firstName.text.isEmpty ? response['firstname'] : _firstName.text,
        _surname.text.isEmpty ? response['surname'] : _surname.text,
        _email.text.isEmpty ? response['email'] : _email.text,
        classification ?? response['classification'],
        status ?? response['status'],
        _address.text.isEmpty ? response['address'] : _address.text,
        zone ?? response['zone'],
        _startDate.text.isEmpty ? response['validity_starts'] : _startDate.text,
        _finishDate.text.isEmpty ? response['validity_ends'] : _finishDate.text,
        widget.data?.resident_code);

    _firstName.clear();
    _surname.clear();
    _email.clear();
    _address.clear();
    _startDate.clear();
    _finishDate.clear();
    _mobileNumber.clear();
    zone = null;
    status = null;
    classification = null;
    callMessage(data['message']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: 20.sp,
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: 25,
                ),
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      'Update Member',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SearchableDropDownListForFetchMember(
                                  onChange: onChange,
                                  data: widget.data,
                                ),
                                NameTextField(
                                    controller: _firstName,
                                    hint: response == null
                                        ? 'First Name'
                                        : response['firstname'],
                                    nameType: "First Name"),
                                NameTextField(
                                    controller: _surname,
                                    hint: response == null
                                        ? 'Surname'
                                        : response['surname'],
                                    nameType: "Surname"),
                                MobileNumberTextField(
                                    controller: _mobileNumber,
                                    fieldName: "Mobile Number",
                                    hintText: response == null
                                        ? 'Mobile Number'
                                        : response['resident_phone']),
                                NameTextField(
                                    controller: _email,
                                    hint: response == null
                                        ? 'Email'
                                        : response['email'],
                                    nameType: " Email"),
                                NameTextField(
                                    controller: _address,
                                    hint: response == null
                                        ? 'Address'
                                        : response['address'],
                                    nameType: "Address"),
                                const TextForForm(text: "Status"),
                                _buildStatus(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                BuildZoneDropDownList(
                                  zone: zone,
                                  hint: response == null
                                      ? 'Zone'
                                      : response['zone'],
                                  onChanged: (value) => setState(() {
                                    zone = value as String;
                                  }),
                                ),
                                const TextForForm(text: "Classification"),
                                _buildClassification(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const TextForForm(text: "Validity Starts"),
                                CustomDatePicker(
                                  date: _startDate,
                                  hint: response == null
                                      ? 'Validity Starts'
                                      : response['validity_starts'],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const TextForForm(text: "Validity Ends"),
                                CustomDatePicker(
                                    date: _finishDate,
                                    hint: response == null
                                        ? 'validity end'
                                        : response['validity_ends']),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ActionPageButton(
                                    onPressed: () async {
                                      updateMember();
                                    },
                                    text: 'Update'),
                                const SizedBox(
                                  height: 30,
                                ),
                              ]),
                        ),
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
