import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magodo/pages/settings_page/custom_list_tiles.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(
                        width: 105,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ),

              Card(
                child: Column(
                  children: const [
                    CustomListTile(prefixIcon: CupertinoIcons.creditcard_fill, text: 'Cards', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.lock_fill, text: 'Change Password', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.question_circle, text: 'Help', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.exclamationmark_circle_fill, text: 'About', data: 'data'),
                    CustomListTile(prefixIcon: Icons.support_agent_outlined, text: 'Contact Us', data: 'data'),
                    CustomListTile(prefixIcon: Icons.business_center, text: 'Our Services', data: 'data'),
                    CustomListTile(prefixIcon: Icons.feedback_sharp, text: 'FAQ', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.doc_plaintext , text: 'Terms of use', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.lock_shield_fill, text: 'privacy Policy', data: 'data'),
                    CustomListTile(prefixIcon: CupertinoIcons.power, text: 'LogOut', data: 'data'),
                  ],
                ),
              ),]
          ),
        ),
      ),
    );
  }
}
