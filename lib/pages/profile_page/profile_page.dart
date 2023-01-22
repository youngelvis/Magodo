// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/profile_page/edit_profile/edit_profile.dart';
import 'package:magodo/pages/settings_page/settings.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class ProfilePage extends StatefulWidget {
  ResidentModel? data;

  ProfilePage({Key? key, this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30.h, left: 10.w, right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              size: 50,
                              color: color.AppColor.landingPageTitle,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        const SizedBox(
                          width: 105,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'Profile',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 50,
                              color: color.AppColor.landingPageTitle,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(
                                data: widget.data,
                              )));
                            }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 90.w,
                  height: 90.h,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/profilePicture.jpeg'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(
                    width: 140.w,
                  ),
                  Text(
                    widget.data?.usr_full_name ?? '',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  const Icon(CupertinoIcons.pen)
                ]),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.data?.usr_group ?? ''),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Text('Status'),
                        trailing: Container(
                          decoration: BoxDecoration(
                              color: widget.data?.user_status == 'Verified'
                                  ? color.AppColor.verifiedColor
                                  : color.AppColor.decline,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(widget.data?.user_status ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text('Zone'),
                        trailing: Text(widget.data?.zone ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Classification'),
                        trailing: Text(widget.data?.category ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Resident Type'),
                        trailing: Text(widget.data?.resident_type ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Address'),
                        trailing: Text(widget.data?.address ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Email'),
                        trailing: Text(widget.data?.email ?? ''),
                      ),
                      ListTile(
                          leading: const Text('Mobile Number'),
                          trailing: Text(widget.data?.msisdn ?? '')),
                      ListTile(
                        leading: const Text('Validity Start'),
                        trailing: Text(widget.data?.validity_starts ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Validity ends'),
                        trailing: Text(widget.data?.validity_ends ?? ''),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 70, left: 20, right: 20, bottom: 50),
                    child: ActionPageButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(data: widget.data,)));
                        }, text: "Update Profile"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
