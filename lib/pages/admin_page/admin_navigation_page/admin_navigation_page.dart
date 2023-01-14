import 'package:flutter/material.dart';
import 'package:magodo/pages/login_page/login_page.dart';

import '../../../components/text_button_nav_page.dart';
import '../../../models/resident_data_model/residentdata.dart';
import '../../change_password/change_password.dart';
import '../../profile_page/edit_profile/edit_profile.dart';
import '../../resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import '../../security_page/view_passcode_record/view_passcode_record.dart';
import '../../super_admin/super_admin_forms/activity_logs_report/activity_log_report.dart';
import '../../super_admin/super_admin_forms/breakdown_summary/breakdown_summary.dart';
import '../../super_admin/super_admin_forms/event_request/event_request_report.dart';
import '../../super_admin/super_admin_forms/movement_register/movement_register.dart';
import '../../super_admin/super_admin_forms/view_member/view_member.dart';
import '../../super_admin/super_admin_forms/view_member_staff/view_member_staff.dart';
import '../admin_forms/identify_newly_registered_members.dart';
import '../admin_forms/verify_identity_of_Newly_employed_staff.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class AdminNavPage extends StatefulWidget {
  ResidentModel? residentModel;

  AdminNavPage({Key? key, this.residentModel}) : super(key: key);

  @override
  State<AdminNavPage> createState() => _AdminNavPageState();
}

class _AdminNavPageState extends State<AdminNavPage> {
  navigateToPage(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            color: color.AppColor.homePageTheme,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 50,
                      color: color.AppColor.landingPage2,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                const SizedBox(
                  height: 50,
                ),
                NavTextButton(
                    icon: Icons.speed,
                    text: 'Dashboard',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdentifyNewlyRegisteredMembers(data: widget.residentModel,)));
                    }),
                NavTextButton(
                    icon: Icons.people_alt_sharp,
                    text: 'verify New Staff',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyNewStaff(data: widget.residentModel,)));
                    }),
                ExpansionTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: color.AppColor.landingPage2,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Profile',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2)),
                    ],
                  ),
                  children: [
                    ListTile(
                        title: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(EditProfile(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(ChangePassword(
                            data: widget.residentModel,
                          ));
                        }),
                  ],
                ),
                ExpansionTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.filter_frames_sharp,
                        color: color.AppColor.landingPage2,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Reports',
                          style: TextStyle(fontSize: 20, color: color.AppColor.landingPage2)),
                    ],
                  ),
                  children: [
                    ListTile(
                        title: Text(
                          'Event Request Report',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(EventRequestReport(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          'View Member',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(ViewMember(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          'View Passcode Record',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(ViewPasscodeRecord(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          ' Member Staff',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(ViewMemberStaff(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          'Movement Register',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(MovementRegister(
                            data: widget.residentModel,
                          ));
                        }),
                    ListTile(
                        title: Text(
                          'Activity Log',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(
                            ViewActivityReport(
                              data: widget.residentModel,
                            ),
                          );
                        }),
                    ListTile(
                        title: Text(
                          'Break Down Report',
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(BreakdownSummary(
                            data: widget.residentModel,
                          ));
                        }),
                  ],
                ),
                NavTextButton(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: () {
                      navigateToPage(const SignIN());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
