// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/activity_log_reportModel/activity_log_reportModel.dart';
import '../../../../models/movement_register_reportModel/movement_register_reportModel.dart';

class ActivityLogReportCard extends StatelessWidget {
  final createdDate,
      otherDetails,
      fullName,
      residentCode,
      action,
      actionDescription,
      actionUser;

  const ActivityLogReportCard(
      {Key? key,
      required this.actionDescription,
      required this.action,
      required this.actionUser,
      required this.fullName,
      required this.createdDate,
      required this.residentCode,
      required this.otherDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.only(top: 20.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title:Text('Date',  style:  TextStyle(fontSize: 15.sp),) ,
              trailing:Text(
                createdDate,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title:Text('Passcode',  style:  TextStyle(fontSize: 15.sp),) ,
              trailing: Text(
                otherDetails,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Full Name",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                fullName,
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                'Resident Code',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                residentCode,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                "Action Performed",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                action,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                " Action By",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                actionUser,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
             ListTile(
              title:  const Text("Action Description"),
              subtitle: Text(
                actionDescription,
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),

             SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  } //
}
