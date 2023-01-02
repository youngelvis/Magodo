import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ValidateResident extends StatefulWidget {
  ResidentModel? data;

  ValidateResident({Key? key, this.data}) : super(key: key);

  @override
  State<ValidateResident> createState() => _ValidateResidentState();
}

TextEditingController _residentCode = TextEditingController();

class _ValidateResidentState extends State<ValidateResident> {
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

  validateResident() async {
    if (_residentCode.text.isNotEmpty) {
      var result = await Services().validateResident(_residentCode.text);
      callMessage(result['error']["message"]);
    }
    final data = await Services().validateResident(_residentCode.text);
    callMessage(data["message"]);
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
                GetPasscodeTitleContainer(
                  title: 'Validate',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Validate Resident',
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
                                  controller: _residentCode,
                                  hint: "resident code",
                                  nameType: "Enter Resident code"),
                              const SizedBox(
                                height: 100,
                              ),
                              ActionPageButton(
                                  onPressed: () {
                                    validateResident();
                                  },
                                  text: 'Validate Resident'),
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
