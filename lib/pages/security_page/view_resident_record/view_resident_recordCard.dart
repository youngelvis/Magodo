import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_report_data_model/resident_report_data_model.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ViewResidentRecordCard extends StatelessWidget {
  ResidentReport data;

  ViewResidentRecordCard({Key? key, required this.data}) : super(key: key);

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
                data.createdDate ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.residentType ?? '',
                style: TextStyle(
                    fontSize: 15.sp, color: color.AppColor.homePageTheme),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title:Text('Passcode', style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.residentCode ?? '', style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              trailing: Container(
                decoration: BoxDecoration(
                    color: data.status == 'Verified'
                        ? Colors.green: data.status =='Unverified'? color.AppColor.homePageTheme
                        : Colors.red,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(

                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.status ?? '',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white
                          )),
                ),
              ),
            ),
            ListTile(
              title:  Text("Resident Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.fullName ?? '',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Resident Address",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.address ?? '',
                  style:  TextStyle(fontSize: 15.sp),
                ),
              ),
            ),

            ListTile(
              title:  Text("Zone",
                  style: TextStyle(fontSize: 15.sp,)),
              trailing: Text(data.mraZone ?? '',
                  style:  TextStyle(fontSize: 15.sp, )),
            ),
            ListTile(
              title:  Text("Validity End Date",
                  style: TextStyle(fontSize: 15.sp, )),
              trailing: Text(data.validityEndsDate ?? '',
                  style:  TextStyle(fontSize:15.sp,)),
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
