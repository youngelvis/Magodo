import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/services/services.dart';

import '../../../components/app_page_theme_action_button.dart';
import '../../../components/roundedDropDownTextfield.dart';
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
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 20.sp, left: 10.sp, right: 10.sp),
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
                      style: TextStyle(fontSize: 30.sp),
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
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Full Name : ${widget.response.fullName} '),
                              _buildStatus(),
                              CustomDatePicker(
                                  date: _startDate,
                                  hint:
                                      '${widget.response.validityStartsDate}'),
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
              ],
            ),
          ),
        ));
  }
}
