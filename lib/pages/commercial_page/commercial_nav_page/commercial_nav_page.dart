import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/commercial_page/commercial_reports/commercial_event_request/commercial_event_records.dart';
import 'package:magodo/pages/landing_page/welcome_screen.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/event_request/event_request.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';
import '../../../components/text_button_nav_page.dart';
import '../../change_password/change_password.dart';
import '../../profile_page/edit_profile/edit_profile.dart';
import '../../resident_Page/form_pages_for_residents/add_staff/add_staff.dart';
import '../../resident_Page/form_pages_for_residents/get_bulk_passcode/get_bulk_passcode.dart';
import '../../resident_Page/form_pages_for_residents/get_future_passcode/get_future_passcode.dart';
import '../../resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class CommercialNavPage extends StatefulWidget {
  ResidentModel? data;

  CommercialNavPage({Key? key, this.data}) : super(key: key);

  @override
  State<CommercialNavPage> createState() => _CommercialNavPageState();
}

class _CommercialNavPageState extends State<CommercialNavPage> {
  navigateToPage(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      child: SingleChildScrollView(
        child: Material(
          child: Row(
            children: [
              Container(
                color: color.AppColor.homePageTheme,
                height: MediaQuery.of(context).size.height,
                width: 300.w,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 50.sp,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      NavTextButton(
                          icon: Icons.speed,
                          text: 'Dashboard',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EventRequest(data: widget.data)));
                          }),
                      ExpansionTile(
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        title: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: color.AppColor.landingPage2,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Profile',
                                style: TextStyle(
                                    fontSize: 17.sp,fontWeight: FontWeight.w600,
                                    color: color.AppColor.landingPage2)),
                          ],
                        ),
                        children: [
                          ListTile(
                              title: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(EditProfile(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(ChangePassword(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Add Staff',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(AddStaff(
                                  data: widget.data,
                                ));
                              }),
                        ],
                      ),
                      NavTextButton(
                          icon: Icons.shopping_bag,
                          text: 'Get Passcode',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetPasscode(
                                      data: widget.data,
                                    )));
                          }),
                      NavTextButton(
                          icon: CupertinoIcons.chat_bubble_2_fill,
                          text: 'Get Bulk Passcode',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetBulkPasscode(
                                      data: widget.data,
                                    )));
                          }),
                      NavTextButton(
                          icon: CupertinoIcons.clock,
                          text: 'Get Future Passcode',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetFuturePasscode(
                                      data: widget.data,
                                    )));
                          }),
                  ExpansionTile(
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    title: Row(
                      children: [
                        Icon(
                          Icons.filter_frames_sharp,
                          color: color.AppColor.landingPage2,
                          size: 30.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Report',
                            style: TextStyle(
                                fontSize: 17.sp,fontWeight: FontWeight.w600,
                                color: color.AppColor.landingPage2)),
                      ],
                    ),
                    children: [
                      ListTile(
                          title: Text(
                            'Passcode Report',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(ViewPasscodeReport(
                              data: widget.data,
                            ));
                          }),
                      ListTile(
                          title: Text(
                            'Event Report',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(CommercialEventReport(
                              data: widget.data,
                            ));
                          }),
                      ],),
                      NavTextButton(
                          icon: Icons.exit_to_app,
                          text: 'Logout',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIN()));
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
