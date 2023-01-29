// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/components/components_for_class_of_varable/category.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/admin_page/admin_navigation_page/admin_navigation_page.dart';
import 'package:magodo/pages/admin_page/admin_page.dart';
import 'package:magodo/pages/navigation_page/resident_navigation_page.dart';
import 'package:magodo/pages/profile_page/profile_page.dart';
import 'package:magodo/pages/security_page/security_navigation_page/security_navigation_page.dart';
import 'package:magodo/pages/super_admin/super_admin_navigation_page/superAdminNavigation.dart';

import '../pages/commercial_page/commercial_nav_page/commercial_nav_page.dart';
import '../pages/commercial_page/commercial_nav_page/commercial_nav_page_for_school.dart';
import '../pages/security_page/security_form/validate_passcode.dart';

class TitleContainer extends StatefulWidget {
  ResidentModel? data;
  final title;

  TitleContainer({Key? key, this.title, this.data}) : super(key: key);

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  String? image;

  initState() {
    getProfile();
  }

  void getProfile() async {
    var residentCode = widget.data?.resident_code;
    var url = 'fetchUserPhoto/$residentCode';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);
    setState(() {
      image = r['data']['file_path'];
    });

  }

  navigateToProfilePage(Widget page) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  List commercial_category = [
    "Church",
    "Mosque",
    "Supermarket",
    "Gym House",
    "Pharmacy",
    "Office",
    "Hospital",
    "Restaurant",
    "Saloon/Spa",
    "Entertainment",
    "Hotel",
    "School",
    "Others"
  ];

  navbarController() {
    if (widget.data?.usr_group == UserGroup.MEMBER) {
      navigateToProfilePage(ResidentNavigationPage(data: widget.data));
    } else if (widget.data?.usr_group == UserGroup.SUPER_ADMIN ||
        widget.data?.usr_group == UserGroup.ZONAL_SUPER_ADMIN) {
      navigateToProfilePage(SuperAdminNavigation(data: widget.data));
    } else if (widget.data?.usr_group == UserGroup.SECURITY) {
      navigateToProfilePage(SecurityNavigationPage(data: widget.data));
    } else if (widget.data?.usr_group == UserGroup.ZONAL_ADMIN ||
        widget.data?.usr_group == UserGroup.ADMIN) {
      navigateToProfilePage(AdminNavPage(
        residentModel: widget.data,
      ));
    } else if (commercial_category.contains(widget.data?.usr_group)) {
      if (widget.data?.usr_group == "School") {
        navigateToProfilePage(CommercialNavPageForSchool(
          data: widget.data,
        ));
      } else {
        navigateToProfilePage(CommercialNavPage(
          data: widget.data,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                    ),
                    SizedBox(width: 95.w),
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
                              child: image == null
                                  ? const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/profileImage.jpg'))
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(image ?? ''),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
