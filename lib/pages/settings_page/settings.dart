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
import '../../components/text_button_nav_page.dart';

class Settings extends StatefulWidget {
  ResidentModel? data;

  Settings({Key? key, this.data}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  navFunc(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Column(children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 40.h, left: 10.w),
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
                  SizedBox(
                    width: 80.sp,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: OverflowBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomListTile(
                        prefixIcon: CupertinoIcons.creditcard_fill,
                        text: 'Cards',
                        data: 'data',
                        colour: color.AppColor.card),
                    CustomListTile(
                      prefixIcon: CupertinoIcons.question_circle,
                      text: 'Help',
                      data: 'data',
                      colour: color.AppColor.help,
                    ),
                    CustomListTile(
                      prefixIcon: CupertinoIcons.exclamationmark_circle_fill,
                      text: 'About us',
                      data: 'https://magodoresidents.org/public/about.php',
                      colour: color.AppColor.xtraCleanBackground,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.support_agent_outlined,
                        size: 30.sp,
                        color: color.AppColor.contactUs,
                      ),
                      title: Text(
                        'Contact us',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: color.AppColor.landingPageTitle,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsPage(
                                      data: widget.data,
                                    )));
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ExpansionTile(
                        iconColor: color.AppColor.landingPageTitle,
                        title: Row(
                          children: [
                            Icon(
                              Icons.business_center,
                              color: color.AppColor.ourServices,
                              size: 30.sp,
                            ),
                            SizedBox(
                              width: 30.h,
                            ),
                            Text('Our services',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: color.AppColor.landingPageTitle)),
                          ],
                        ),
                        children:  [
                          CustomListTile(
                            size: 15.sp,
                              text: 'Xtra-clean',
                              data:
                                  'https://magodoresidents.org/public/service_xtraclean.php'),
                          CustomListTile(
                              size: 15.sp,
                              text: 'Bill payment',
                              data:
                                  'https://magodoresidents.org/public/bills_payment.php'),
                          CustomListTile(
                              size: 15.sp,
                              text: 'NIMC Payment',
                              data:
                                  'https://magodoresidents.org/public/nimc.php'),
                          CustomListTile(
                              size: 15.sp,
                              text: 'Vehicle License validity Verification ',
                              data:
                                  'https://magodoresidents.org/public/vehicle_license.php'),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      prefixIcon: Icons.feedback_sharp,
                      text: 'FAQ',
                      data: 'https://magodoresidents.org/public/faqs.php',
                      colour: color.AppColor.faq,
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.power,
                        size: 30.sp,
                        color: color.AppColor.aboutUs,
                      ),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: color.AppColor.landingPageTitle,
                        ),
                      ),
                      onTap:() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
