import 'package:flutter/material.dart';
import 'package:magodo/pages/security_page/security_form/validate_passcode.dart';
import '../../../components/text_button_nav_page.dart';
import '../../../models/resident_data_model/residentdata.dart';
import '../../change_password/change_password.dart';
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
    return SingleChildScrollView(
        child: Material(
            child: Row(
      children: [
        Container(
          color: color.AppColor.homePageTheme,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 1.5,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  navigateToPage(ValidatePasscode(
                    data: widget.data,
                  ));
                }),
            NavTextButton(
                icon: Icons.speed,
                text: 'Guest Sign-Out',
                onPressed: () {
                  navigateToPage(GuestSignOut(
                    data: widget.data,
                  ));
                }),
            NavTextButton(
                icon: Icons.speed,
                text: 'Validate Resident',
                onPressed: () {
                  navigateToPage(ValidateResident(
                    data: widget.data,
                  ));
                }),
            NavTextButton(
                icon: Icons.speed,
                text: 'Validate Staff',
                onPressed: () {
                  navigateToPage(ValidateStaff(
                    data: widget.data,
                  ));
                }),
            NavTextButton(
                icon: Icons.speed,
                text: 'Validate Parent',
                onPressed: () {
                  navigateToPage(ValidateParent(
                    data: widget.data,
                  ));
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
                          fontSize: 20, color: color.AppColor.landingPage2)),
                ],
              ),
              children: [
                ListTile(
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 20, color: color.AppColor.landingPage2),
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
                          fontSize: 20, color: color.AppColor.landingPage2),
                    ),
                    onTap: () {
                      navigateToPage(ChangePassword(
                        data: widget.data,
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
                        style: TextStyle(
                            fontSize: 20, color: color.AppColor.landingPage2)),
                  ],
                ),
                children: [
                  ListTile(
                      title: Text(
                        'View Passcode',
                        style: TextStyle(
                            fontSize: 20, color: color.AppColor.landingPage2),
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
                            fontSize: 20, color: color.AppColor.landingPage2),
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
                            fontSize: 20, color: color.AppColor.landingPage2),
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
                            fontSize: 20, color: color.AppColor.landingPage2),
                      ),
                      onTap: () {
                        navigateToPage(ViewResidentRecords(
                          data: widget.data,
                        ));
                      }),
                ]),
          ]),
        )
      ],
    )));
  }
}
