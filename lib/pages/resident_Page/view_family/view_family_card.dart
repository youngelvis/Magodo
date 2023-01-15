// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewFamilyCard extends StatelessWidget {
  final fullName, status, dependentCode, email, date, dependantPhone;

  const ViewFamilyCard({
    Key? key,
    required this.fullName,
    required this.status,
    required this.dependentCode,
    required this.email,
    required this.date,
    required this.dependantPhone

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              date,
              style:  TextStyle(fontSize: 20.sp),
            ),
            trailing: Text(
              status,
              style:  TextStyle(fontSize: 20.sp),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              dependentCode,
              style:  TextStyle(fontSize: 20.sp),
            ),
          ),
          ListTile(
            title: Text(
              'Full Name',
              style: TextStyle(fontSize: 25.sp),
            ),
            trailing: Text(
              fullName,
              style: TextStyle(fontSize: 25.sp),
            ),
          ),
          ListTile(
            title:  Text(
              'Phone Number',
              style: TextStyle(fontSize: 25.sp),
            ),
            trailing: Text(
              dependantPhone,
              style: TextStyle(fontSize: 25.sp),
            ),
          ),
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(fontSize: 25.sp),
            ),
            trailing: Text(
              email,
              style:  TextStyle(fontSize: 25.sp),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  } //
}
