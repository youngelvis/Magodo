// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/text_button_nav_page.dart';
import 'package:magodo/models/event_requestModel/event_requestModel.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/add_family/add_family.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/add_staff/add_staff.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/event_request/event_request.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_bulk_passcode/get_bulk_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_future_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/register_vechicle.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';
import 'package:magodo/pages/resident_Page/resident_vehicle/view_vehicle_report.dart';
import 'package:magodo/pages/resident_Page/view_family/view_family_report.dart';
import 'package:magodo/pages/resident_Page/view_staff/view_staff_report.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../change_password/change_password.dart';
import '../profile_page/edit_profile/edit_profile.dart';

class ResidentNavigationPage extends StatefulWidget {
  ResidentModel? data;

 ResidentNavigationPage({Key? key, required this.data})
      : super(key: key);

  @override
  State<ResidentNavigationPage> createState() => _ResidentNavigationPageState();
}

class _ResidentNavigationPageState extends State<ResidentNavigationPage> {
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
                  width: MediaQuery.of(context).size.width / 1.5,
                  
                  child: SingleChildScrollView(
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
                                    data: widget.data,
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
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'Add Family',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(AddFamily(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'Add Staff',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(AddStaff(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'Register Vehicle',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(RegisterVehicle(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'Event Passcode',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(EventRequest(
                                    data: widget.data,
                                  ));
                                }),
                          ],
                        ),
                        NavTextButton(
                            icon: Icons.speed,
                            text: 'Dashboard',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResidentPageLandingPage(data: widget.data)));
                            }),

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
                            icon: Icons.shopping_bag,
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
                            icon: Icons.shopping_bag,
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
                              Text('Reports',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2)),
                            ],
                          ),
                          children: [
                            ListTile(
                                title: Text(
                                  'View Family Report',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(ViewFamilyMembers(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'View Staff Report',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(ViewStaffMembers(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'view Vehicle Report',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(ViewVehicleReport(
                                    data: widget.data,
                                  ));
                                }),
                            ListTile(
                                title: Text(
                                  'Event Report',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),

                                ),
                            ListTile(
                                title: Text(
                                  'View Passcode Report',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.landingPage2),
                                ),
                                onTap: () {
                                  navigateToPage(ResidentPageLandingPage(
                                    data: widget.data,
                                  ));
                                }),
                          ],
                        ),
                        NavTextButton(
                            icon: Icons.shopping_bag,
                            text: 'Logout',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIN()));
                            }),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
