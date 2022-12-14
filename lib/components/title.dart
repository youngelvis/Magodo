// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
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
    print(widget.data?.usr_group);
    if (widget.data?.usr_group == 'member') {
      navigateToProfilePage(ResidentNavigationPage(data: widget.data));
    } else if (widget.data?.usr_group == 'Sadmin') {
      navigateToProfilePage(SuperAdminNavigation(data: widget.data));
    }else if(widget.data?.usr_group == 'Security'){
      navigateToProfilePage(SecurityNavigationPage(data: widget.data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                width: 100,
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
                    const SizedBox(width: 120),
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
      ),
    );
  }
}
