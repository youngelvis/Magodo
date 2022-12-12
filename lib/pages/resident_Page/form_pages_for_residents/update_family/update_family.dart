import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/add_family_data_model/familydata.dart';

class UpdateFamily extends StatefulWidget {
  final data;
  Family response;

   UpdateFamily({Key? key, required this.data, required this.response}) : super(key: key);

  @override
  State<UpdateFamily> createState() => _UpdateFamilyState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

class _UpdateFamilyState extends State<UpdateFamily> {
  @override
  Widget build(BuildContext context) {
    _updateFamily() async {


    }

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
                      'Update Family',
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
                                  controller: _fullName,
                                  hint: "${widget.response.fullName}",
                                  nameType: "Full Name"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: 'Mobile number',
                                  hintText: ' ${widget.response.status}'),
                              NameTextField(
                                  controller: _email,
                                  hint: "${widget.response.email}",
                                  nameType: "Enter email address"),

                              const SizedBox(
                                height: 40,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _updateFamily();
                                  },
                                  text: 'update Family'),
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
