// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/movement_register_reportModel/movement_register_reportModel.dart';

class MovementRegisterCard extends StatelessWidget {
  MovementRegisterReport data;

  MovementRegisterCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                data.createdDate ?? '',
                style:  TextStyle(fontSize: 20.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                data.passcode ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),

            ListTile(
              title:  Text(
                'Resident Code',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.residentCode ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                " Visitor's phone",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.visitorMsisdn ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Resident Phone",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.residentMsisdn ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                "Resident Name",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.residentFullName ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                "Time in",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.timeIn ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Time out",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.timeOut ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  } //
}
