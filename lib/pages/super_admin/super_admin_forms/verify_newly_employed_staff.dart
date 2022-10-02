import 'package:flutter/material.dart';
import 'package:magodo/components/action_page_button2.dart';
import '../../../components/date_text_field.dart';
import '../../../components/roundedDropDownTextfield.dart';
import '../../../components/text_for_form.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../components/title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class VerifyNewlyEmployedStaff extends StatefulWidget {
  final data;

  const VerifyNewlyEmployedStaff({Key? key, required this.data})
      : super(key: key);

  @override
  State<VerifyNewlyEmployedStaff> createState() =>
      _VerifyNewlyEmployedStaffState();
}

class _VerifyNewlyEmployedStaffState extends State<VerifyNewlyEmployedStaff> {
  TextEditingController _residentCode = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _residentNumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _staffName = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _employmentStatus = TextEditingController();
  TextEditingController _staffContactAddress = TextEditingController();

  String? status;
  final statusOptions = ['0', '1', '2', '3', '4', '5', '6'];
  String? selectStaff;

  final selectStaffOptions = ['0', '1', '2', '3', '4', '5', '6'];

  Widget _buildSelectStaff() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose number',
        style: TextStyle(fontSize: 15),
      ),
      value: selectStaff,
      onChanged: (value) => setState(() {
        selectStaff = value as String;
      }),
      items: selectStaffOptions.map(buildResidentItem).toList(),
    );
  }

  DropdownMenuItem<String> buildResidentItem(String residentOptions) =>
      DropdownMenuItem(
        value: residentOptions,
        child: Text(
          residentOptions,
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
                      'Verify Newly Employed Staff',
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
                              const TextForForm(text: "Select Staff"),
                              _buildSelectStaff(),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _residentCode,
                                  hint: "Enter resident code",
                                  nameType: "Staff Resident Code"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _residentNumber,
                                  hint: "Enter resident Number",
                                  nameType: "Resident Number"),
                              const SizedBox(
                                height: 20,
                              ),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: ' Mobile Number',
                                  hintText: 'Enter mobile number'),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffName,
                                  hint: "Enter staff name",
                                  nameType: "Staff Name"),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Date"),
                              CustomDatePicker(date: _date),
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
                              NameTextField(
                                  controller: _employmentStatus,
                                  hint: "Enter employment status",
                                  nameType: " Employment Status"),
                              const SizedBox(
                                height: 20,
                              ),
                              NameTextField(
                                  controller: _staffContactAddress,
                                  hint: "Enter staff contact address",
                                  nameType: "Staff Contact Address"),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.homePageTheme,
                                    text: 'Authorize',
                                  ),
                                  const SizedBox(width: 50,),
                                  ActionPageButton2(
                                    onPressed: () {},
                                    primaryColor: color.AppColor.decline,
                                    text: 'Decline',
                                  ),
                                ],
                              )
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
