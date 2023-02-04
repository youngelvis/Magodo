import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/security_page/security_form/validate_passcode.dart';
import '../../../components/text_button_nav_page.dart';
import '../../../models/resident_data_model/residentdata.dart';
import '../../change_password/change_password.dart';
import '../../login_page/login_page.dart';
import '../../profile_page/edit_profile/edit_profile.dart';
import '../security_form/guest_sign_out.dart';
import '../security_form/validate_parent.dart';
import '../security_form/validate_resident.dart';
import '../security_form/validate_staff.dart';
import '../view_parent_record/view_parent_record.dart';
import '../view_passcode_record/view_passcode_record.dart';
import '../view_resident_record/view_resident_record.dart';
import '../view_staff_record/view_staff_record.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SecurityNavigationPage extends StatefulWidget {
  ResidentModel? data;

  SecurityNavigationPage({Key? key, this.data}) : super(key: key);

  @override
  State<SecurityNavigationPage> createState() => _SecurityNavigationPageState();
}

class _SecurityNavigationPageState extends State<SecurityNavigationPage> {
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 50.h,
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
                SizedBox(
                  height: 50.h,
                ),
                NavTextButton(
                    icon: Icons.speed,
                    text: 'Dashboard',
                    onPressed: () {
                      navigateToPage(ValidatePasscode(
                        data: widget.data,
                      ));
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
                        size: 30.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('Profile',
                          style: TextStyle(
                              fontSize: 15.sp, color: color.AppColor.landingPage2)),
                    ],
                  ),
                  children: [
                    ListTile(
                        title: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 15.sp, color: color.AppColor.landingPage2),
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
                              fontSize: 15.sp, color: color.AppColor.landingPage2),
                        ),
                        onTap: () {
                          navigateToPage(ChangePassword(
                            data: widget.data,
                          ));
                        }),
                  ],
                ),

                NavTextButton(
                    icon: CupertinoIcons.house,
                    text: 'Validate Resident',
                    onPressed: () {
                      navigateToPage(ValidateResident(
                        data: widget.data,
                      ));
                    }),
                NavTextButton(
                    icon: CupertinoIcons.person_3_fill,
                    text: 'Validate Staff',
                    onPressed: () {
                      navigateToPage(ValidateStaff(
                        data: widget.data,
                      ));
                    }),
                NavTextButton(
                    icon: Icons.wc_rounded,
                    text: 'Validate Parent',
                    onPressed: () {
                      navigateToPage(ValidateParent(
                        data: widget.data,
                      ));
                    }),
                NavTextButton(
                    icon: Icons.exit_to_app,
                    text: 'Guest Sign-Out',
                    onPressed: () {
                      navigateToPage(GuestSignOut(
                        data: widget.data,
                      ));
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
                         SizedBox(
                          width: 10.w,
                        ),
                        Text('Reports',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2)),
                      ],
                    ),
                    children: [
                      ListTile(
                          title: Text(
                            'View Passcode',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(ViewPasscodeRecord(
                              data: widget.data,
                            ));
                          }),
                      ListTile(
                          title: Text(
                            'View parent Records',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(ViewParentRecord(
                              data: widget.data,
                            ));
                          }),
                      ListTile(
                          title: Text(
                            'View Staff Records',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(ViewStaffRecord(
                              data: widget.data,
                            ));
                          }),
                      ListTile(
                          title: Text(
                            'View Resident Records',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: color.AppColor.landingPage2),
                          ),
                          onTap: () {
                            navigateToPage(ViewResidentRecords(
                              data: widget.data,
                            ));
                          }),
                    ]),
                NavTextButton(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: () {
                      navigateToPage(const SignIN());
                    }),
              ]),
            ),
          )
        ],
      ))),
    );
  }
}
