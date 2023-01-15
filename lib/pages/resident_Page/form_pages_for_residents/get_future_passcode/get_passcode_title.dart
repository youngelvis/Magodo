// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/navigation_page/resident_navigation_page.dart';
import 'package:magodo/pages/profile_page/profile_page.dart';

import '../../../../components/components_for_class_of_varable/userGroup.dart';
import '../../../admin_page/admin_navigation_page/admin_navigation_page.dart';
import '../../../security_page/security_form/validate_passcode.dart';
import '../../../security_page/security_navigation_page/security_navigation_page.dart';
import '../../../super_admin/super_admin_navigation_page/superAdminNavigation.dart';

class GetPasscodeTitleContainer extends StatefulWidget {
  ResidentModel? data;
  final title;

  GetPasscodeTitleContainer({Key? key, this.title, required this.data})
      : super(key: key);

  @override
  State<GetPasscodeTitleContainer> createState() =>
      _GetPasscodeTitleContainerState();
}

class _GetPasscodeTitleContainerState extends State<GetPasscodeTitleContainer> {
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
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
              const SizedBox(
                width: 91,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(width: 70),
                    Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            width: 30,
                            height: 30,
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
