import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/change_password/change_password.dart';
import 'package:magodo/pages/contact_us/contact_us_page.dart';
import 'package:magodo/pages/landing_page/welcome_screen.dart';
import 'package:magodo/pages/settings_page/custom_list_tiles.dart';
import '../../../components/components_for_class_of_varable/colors.dart'
    as color;

class Settings extends StatefulWidget {
  ResidentModel? data;

  Settings({Key? key, this.data}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

navFunc(page) {}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
                children: [
                  const CustomListTile(
                      prefixIcon: CupertinoIcons.creditcard_fill,
                      text: 'Cards',
                      data: 'data'),
                  ListTile(
                    leading: const Icon(CupertinoIcons.lock_fill),
                    title: const Text('Change Password'),
                    onTap: navFunc(ChangePassword(data: widget.data)),
                  ),
                  const CustomListTile(
                      prefixIcon: CupertinoIcons.question_circle,
                      text: 'Help',
                      data: 'data'),
                  const CustomListTile(
                      prefixIcon: CupertinoIcons.exclamationmark_circle_fill,
                      text: 'About us',
                      data: 'https://magodoresidents.org/public/about.php'),
                  ListTile(
                    leading: const Icon(Icons.support_agent_outlined),
                    title: const Text('Contact us'),
                    onTap: navFunc(const ContactUsPage()),
                  ),
                  ExpansionTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.business_center,
                            color: color.AppColor.landingPage2,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Text('Our services',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: color.AppColor.landingPage2)),
                        ],
                      ),
                      children: const [
                        CustomListTile(
                            text: 'Xtra-clean',
                            data:
                                'https://magodoresidents.org/public/service_xtraclean.php'),
                        CustomListTile(
                            text: 'Bill payment',
                            data:
                                'https://magodoresidents.org/public/bills_payment.php'),
                        CustomListTile(
                            text: 'NIMC Payment',
                            data:
                                'https://magodoresidents.org/public/nimc.php'),
                        CustomListTile(
                            text: 'Vehicle License validity Verification ',
                            data:
                                'https://magodoresidents.org/public/vehicle_license.php'),
                      ]),
                  const CustomListTile(
                      prefixIcon: Icons.business_center,
                      text: 'Our Services',
                      data: 'data'),
                  const CustomListTile(
                      prefixIcon: Icons.feedback_sharp,
                      text: 'FAQ',
                      data: 'https://magodoresidents.org/public/faqs.php'),
                  ListTile(
                    leading: const Icon(CupertinoIcons.power),
                    title: const Text('Log out'),
                    onTap: navFunc(const WelcomeScreen()),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
