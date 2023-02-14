import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/staff_report_data_model/staff_report_data_model.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ViewStaffRecordCard extends StatelessWidget {
  StaffReport data;

  ViewStaffRecordCard({Key? key, required this.data}) : super(key: key);

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
                data.dateCreated ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.employmentStatus ?? '',
                style: TextStyle(
                    fontSize: 15, color: color.AppColor.homePageTheme),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(data.staffPasscode ?? ''),
            ),
            ListTile(
                trailing: Container(
              decoration: BoxDecoration(
                  color: data.identityStatus == 'Verified'
                      ? Colors.green
                      : Colors.red,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(data.identityStatus ?? '',
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    )),
              ),
            )),
            ListTile(
              title:  Text("Dependant Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.dependantName ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Dependant Address",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 175.w,
                child: Text(
                  data.dependantContacts ?? '',
                  style:  TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
            ListTile(
              title:  Text("Dependant Phone",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.dependantPhone ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Relationship",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.relationship ?? '-',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("date of employment",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.empdateOrDob ?? '-',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Zone",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.zone ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Validity End Date",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.validityEnds ?? '',
                  style:  TextStyle(fontSize: 15, color: Colors.black)),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
