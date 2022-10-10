import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class GuestSignOut extends StatefulWidget {
  final data;

  const GuestSignOut({Key? key, required this.data}) : super(key: key);

  @override
  State<GuestSignOut> createState() => _GuestSignOutState();
}

TextEditingController _passcode = TextEditingController();

class _GuestSignOutState extends State<GuestSignOut> {
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
                  title: 'Dashboard',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Visitor Sign Out',
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
                                  controller: _passcode,
                                  hint: "passcode",
                                  nameType: "Sign Out Passcode"),
                              const SizedBox(
                                height: 100,
                              ),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Sign Out Passcode'),
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
