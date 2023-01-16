import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';

import '../../../components/app_page_theme_action_button.dart';
import '../../../components/date_text_field.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';
import '../../../services/services.dart';

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
        style:  TextStyle(fontSize: 15),
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

  extendParentValidity() async {
  //   final data = await Services().extendParentValidity(
  //     widget.data.resident_code
  //     _parentMobile.text,
  //     _parentFullName.text,
  //     _validityStarts.text,
  //     _validityEnds.text,
  //     _parentAddress.text,
  //   );
  //   print(data);
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
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                          MobileNumberTextField(
                              controller: _parentMobile,
                              fieldName: ' Parent Mobile Number',
                              hintText: 'parent mobile number'),
                          NameTextField(
                              controller: _parentFullName,
                              hint: "Enter Parent Full name",
                              nameType: "Full Name"),
                          const TextForForm(text: "Validity Starts"),
                          CustomDatePicker(
                            date: _validityStarts,
                          ),
                          const TextForForm(text: "Validity Starts"),
                          CustomDatePicker(
                            date: _validityEnds,
                          ),
                          _buildStatus(),
                          NameTextField(
                              controller: _parentAddress,
                              hint: "Enter Parent Address",
                              nameType: "Parent Address"),
                          SizedBox(
                            height: 30.h,
                          ),
                          ActionPageButton(
                              onPressed: () async {

                              },
                              text: 'Validate Parent'),
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
