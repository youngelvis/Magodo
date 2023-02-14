import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/components/text_button_nav_page.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/admin_page/zonal_superadmin_vehicle/zonalAdminVehicle.dart';
import 'package:magodo/pages/change_password/change_password.dart';
import 'package:magodo/pages/login_page/login_page.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/register_vechicle.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/breakdown_summary/breakdown_summary.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/movement_register/movement_register.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/superAdmin_vehicleRegistration/superA_vehicleRegistration.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/view_member/view_member.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/view_member_staff/view_member_staff.dart';
import '../../profile_page/edit_profile/edit_profile.dart';
import '../../security_page/view_passcode_record/view_passcode_record.dart';
import '../super_admin_forms/activity_logs_report/activity_log_report.dart';
import '../super_admin_forms/add_new_administrative_user.dart';
import '../super_admin_forms/event_request/event_request_report.dart';
import '../super_admin_forms/update_member.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SuperAdminNavigation extends StatefulWidget {
  ResidentModel? data;

  SuperAdminNavigation({Key? key, this.data}) : super(key: key);

  @override
  State<SuperAdminNavigation> createState() => _SuperAdminNavigationState();
}

class _SuperAdminNavigationState extends State<SuperAdminNavigation> {
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
                        height: 50.sp,
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
                            navigateToPage(AddNewAdministrativeUser(
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
                              size: 30,
                            ),
                             SizedBox(
                              width: 10.w,
                            ),
                            Text('Profile',
                                style: TextStyle(
                                    fontSize: 15.sp,
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
                        ],
                      ),
                      NavTextButton(
                          icon: Icons.people_alt_sharp,
                          text: 'Update Member',
                          onPressed: () {
                            navigateToPage(UpdateMember(data: widget.data));
                          }),
                      NavTextButton(
                          icon: Icons.car_rental_rounded,
                          text: 'Register Vehicle',
                          onPressed: () {
                            navigateToPage(RegisterVehicle(data: widget.data));
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
                                style: TextStyle(fontSize: 15.sp, color: color.AppColor.landingPage2)),
                          ],
                        ),
                        children: [
                          ListTile(
                              title: Text(
                                'Event Request Report',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(EventRequestReport(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Vehicle Report',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                widget.data?.usr_group == UserGroup.SUPER_ADMIN?
                                navigateToPage(SuperAdminVehicleReport(
                                  data: widget.data,
                                )): navigateToPage(ZonalAdminVehicle(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Member Report',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(ViewMember(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Passcode Report',
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
                                'Staff Report',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(ViewMemberStaff(
                                  data: widget.data,
                                ));
                              }),
                          ListTile(
                              title: Text(
                                'Movement Register',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(MovementRegister(
                                  data: widget.data,
                                ));
                              }),

                          ListTile(
                              title: Text(
                                'Activity Log',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(
                                  ViewActivityReport(
                                    data: widget.data,
                                  ),
                                );
                              }),
                          ListTile(
                              title: Text(
                                'Break Down Report',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: color.AppColor.landingPage2),
                              ),
                              onTap: () {
                                navigateToPage(BreakdownSummary(
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
                                      data:widget.data,
                                    )));
                          }),
                      NavTextButton(
                          icon: Icons.logout,
                          text: 'Logout',
                          onPressed: () {
                            navigateToPage(const SignIN());
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
