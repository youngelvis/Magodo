import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/commercial_page/commercial_forms/extend_parent_validity/selectParentDropdown.dart';
import 'package:magodo/pages/commercial_page/commercial_reports/parent_report/view_parent_records.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '/../../../components/app_page_theme_action_button.dart';
import '/../../../components/date_text_field.dart';
import '/../../../components/roundedDropDownTextfield.dart';
import '/../../../components/text_for_form.dart';
import '/../../../components/textfields_types/mobile_num_textfield.dart';
import '/../../../components/textfields_types/name_textfield.dart';
import '/../../../components/title.dart';
import '/../../../services/services.dart';

class ExtendParentValidity extends StatefulWidget {
  ResidentModel? data;

  ExtendParentValidity({Key? key, this.data}) : super(key: key);

  @override
  State<ExtendParentValidity> createState() => _ExtendParentValidityState();
}

TextEditingController _parentMobile = TextEditingController();
TextEditingController _parentFullName = TextEditingController();
TextEditingController _validityStarts = TextEditingController();
TextEditingController _validityEnds = TextEditingController();
TextEditingController _parentAddress = TextEditingController();

class _ExtendParentValidityState extends State<ExtendParentValidity> {
  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Unverified',
    'Declined',
    'Verified',
  ];

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'status',
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
  var response;
  String? residentcode;

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    residentcode = residentCode?[0];
    print(residentcode);
    final data = await Services().getParentDetail(residentcode);
      print(data);
    setState(() {
      response = data['data'];
    });
    print(response);
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
  extendParentValidity() async {
    final data = await Services().extendParentValidity(
      widget.data?.resident_code,
      response['PARENT_PASSCODE'] ?? '',
      _parentMobile.text.isEmpty
          ? response['PARENT_MOBILE']
          : _parentMobile.text,
      _parentFullName.text.isEmpty
          ? response['PARENT_NAME']
          : _parentFullName.text,
      _validityStarts.text.isEmpty
          ? response['VALIDITY_STARTS']
          : _validityStarts.text,
      _validityEnds.text.isEmpty
          ? response['VALIDITY_ENDS']
          : _validityEnds.text,
      _parentAddress.text.isEmpty
          ? response['PARENT_ADDRESS']
          : _parentAddress.text,
      status ?? response['STATUS'],
    );
    print(data);
_parentAddress.clear();
    _parentFullName.clear();
    _parentMobile.clear();
    _validityEnds.clear();
    _validityStarts.clear();
    status = null;
    callMessage(data['message']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              TitleContainer(
                title: 'Dashboard',
                data: widget.data,
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Text(
                    'Extend Parent Validity',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                            text: 'Select Parent',
                          ),
                          SelectParentDropdown(
                            data: widget.data,
                            onChange: onChange,
                          ),
                          MobileNumberTextField(
                            controller: _parentMobile,
                            fieldName: ' Parent Mobile Number',
                            hintText: response == null
                                ? 'Parent Mobile Number'
                                : response['PARENT_MOBILE'],
                          ),
                          NameTextField(
                              controller: _parentFullName,
                              hint: response == null
                                  ? 'Parent full name'
                                  : response['PARENT_NAME'],
                              nameType: "Parent Name"),
                          const TextForForm(text: "Validity Starts"),
                          CustomDatePicker(
                            date: _validityStarts,
                            hint: response == null
                                ? 'Validity Starts'
                                : response['VALIDITY_STARTS'],
                          ),
                          const TextForForm(text: "Validity Ends"),
                          CustomDatePicker(
                            date: _validityEnds,
                            hint: response == null
                                ? 'Validity Ends'
                                : response['VALIDITY_ENDS'],
                          ),
                          const SizedBox(height: 20,),
                          const TextForForm(text: "Status"),
                          _buildStatus(),
                          NameTextField(
                              controller: _parentAddress,
                              hint: response == null
                                  ? 'Parent Address'
                                  : response['PARENT_ADDRESS'],
                              nameType: "Parent Address"),
                          SizedBox(
                            height: 30.h,
                          ),
                          ActionPageButton(
                              onPressed: () async {
                                await extendParentValidity();


                              }, text: 'Extend Validity'),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
