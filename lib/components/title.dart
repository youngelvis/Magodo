// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/admin_page/admin_navigation_page/admin_navigation_page.dart';
import 'package:magodo/pages/admin_page/admin_page.dart';
import 'package:magodo/pages/navigation_page/resident_navigation_page.dart';
import 'package:magodo/pages/profile_page/profile_page.dart';
import 'package:magodo/pages/security_page/security_navigation_page/security_navigation_page.dart';
import 'package:magodo/pages/super_admin/super_admin_navigation_page/superAdminNavigation.dart';

import '../pages/security_page/security_form/validate_passcode.dart';

class TitleContainer extends StatefulWidget {
  ResidentModel? data;
  final title;

  TitleContainer({Key? key, this.title, this.data}) : super(key: key);

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  navigateToProfilePage(Widget page) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  navbarController() {
    if (widget.data?.usr_group == UserGroup.MEMBER) {
      navigateToProfilePage(ResidentNavigationPage(data: widget.data));
    } else if (widget.data?.usr_group == UserGroup.SUPER_ADMIN|| widget.data?.usr_group == UserGroup.ZONAL_SUPER_ADMIN) {
      navigateToProfilePage(SuperAdminNavigation(data: widget.data));
    }else if(widget.data?.usr_group == UserGroup.SECURITY){
      navigateToProfilePage(SecurityNavigationPage(data: widget.data));
    }else if(widget.data?.usr_group == UserGroup.ZONAL_ADMIN|| widget.data?.usr_group == UserGroup.ADMIN){
      navigateToProfilePage(AdminNavPage(residentModel: widget.data,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 50,
                ),
                onPressed: () {
                  navbarController();
                }),
             SizedBox(
              width: 80.w,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                   SizedBox(width: 85.w),
                  Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      data: widget.data,
                                    ),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profilePicture.jpeg'),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
