import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/parent_report_data_model/parent_report_data_model.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
class ViewParentRecordCard extends StatelessWidget {
  ParentReport data;
   ViewParentRecordCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                data.dateCreated ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),

            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(data.parentPasscode ?? '',
                  style:  TextStyle(fontSize: 15.sp)),
            ),
            ListTile(
              trailing: Container(
                decoration: BoxDecoration(
                    color: data.status == 'Verified'
                        ? color.AppColor.verifiedColor
                        : color.AppColor.decline,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data.status ?? '',
                      style: TextStyle(
                          fontSize: 15.sp,
                        color: Colors.white
                          ),),
              ),
              )
            ),
            ListTile(
              title:  Text("Resident Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.residentName ?? '',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Parent Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.parentName ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Parent Phone",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.parentMobile ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title: Text("Parent Address",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.parentAddress ?? '',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
            ListTile(
              title:  Text("Business Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.businessName ?? '-',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
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
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
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
