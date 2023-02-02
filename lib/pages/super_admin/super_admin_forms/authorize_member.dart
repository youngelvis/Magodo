import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/app_page_theme_action_button.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../models/view_memberModel/view_memberModel.dart';

class AuthorizeMember extends StatefulWidget {
  ViewMemberModel response;
  final userGroup;

  AuthorizeMember({Key? key, required this.response, this.userGroup})
      : super(key: key);

  @override
  State<AuthorizeMember> createState() => _AuthorizeMemberState();
}

TextEditingController _startDate = TextEditingController();
TextEditingController _finishDate = TextEditingController();

class _AuthorizeMemberState extends State<AuthorizeMember> {
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
        widget.response.status ?? statusOptions[0],
        style:  TextStyle(fontSize: 15.sp),
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
          style:  TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );

  authoriseMember() async {
    final data = await Services().finalAuthorization(
        widget.response.residentCode,
        widget.response.validityStartsDate,
        widget.response.validityEndsDate,
        widget.response.status,
        widget.userGroup);
    var message = data['message'];
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 50.h, ),
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                   Center(
                    child: Text(
                      'Authorize Member',
                      style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                const Divider(),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Container(
                        padding:  EdgeInsets.only(left: 25.w, right: 25.w ),
                        child: Form(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Full Name : ${widget.response.fullName} ',
                                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),),
                                SizedBox(height: 40.h,),
                                const TextForForm(text: "Status"),
                                _buildStatus(),
                                const TextForForm(text: "Validity Start"),
                                CustomDatePicker(
                                    date: _startDate,
                                    hint:
                                        '${widget.response.validityStartsDate}'),
                                const TextForForm(text: "Validity Ends"),
                                CustomDatePicker(
                                    date: _finishDate,
                                    hint: '${widget.response.validityEndsDate}'),
                                ActionPageButton(
                                    onPressed: () {
                                      authoriseMember();
                                    },
                                    text: 'Authorize Member'),
                                const SizedBox(
                                  height: 50,
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
