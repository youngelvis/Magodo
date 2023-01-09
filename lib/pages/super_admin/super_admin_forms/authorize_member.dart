import 'package:flutter/material.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/services/services.dart';

import '../../../components/app_page_theme_action_button.dart';
import '../../../components/roundedDropDownTextfield.dart';

class AuthorizeMember extends StatefulWidget {
  final response;

  const AuthorizeMember({Key? key, required this.response}) : super(key: key);

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
        widget.response['status'],
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

  authoriseMember() async {
    final data = await Services().authorisedMember(
        widget.response['resident_reg_code'],
        widget.response['validity_starts'],
        widget.response['validity_ends'],
        widget.response['status'],
        widget.response['user_group']);
    print(data);
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
                  const Center(
                    child: Text(
                      'Authorize Member',
                      style: TextStyle(fontSize: 30),
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
                              Text(
                                  'Full Name : ${widget.response['full_name']} '),
                              _buildStatus(),
                              CustomDatePicker(
                                  date: _startDate,
                                  hint:
                                      '${widget.response['validity_starts']}'),
                              CustomDatePicker(
                                  date: _finishDate,
                                  hint: '${widget.response['validity_ends']}'),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Authorize Member'),
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
