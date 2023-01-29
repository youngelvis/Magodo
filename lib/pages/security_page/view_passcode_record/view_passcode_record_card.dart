import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/passcode_report_data_model/passcode_report_data_model.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../models/resident_data_model/residentdata.dart';

class ViewPasscodeRecordCard extends StatelessWidget {
  PasscodeReport data;
  ResidentModel? residentData;
  ViewPasscodeRecordCard({Key? key, required this.data, this.residentData}) : super(key: key);

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
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                data.passcode ?? '',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                    color: data.doNotHonorStatus == 'Honor'
                        ? color.AppColor.verifiedColor
                        : color.AppColor.decline,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(data.doNotHonorStatus ?? '',
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            ListTile(
              title:  Text("Visitor Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.visitorName ?? '',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title: Text("Visitor Phone",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.visitorMsisdn ?? '-',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Resident Name",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.residentName ?? '-',
                  style:  TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Resident Code",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.residentCode ?? '-',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
            ),
            ListTile(
              title:  Text("Resident Address",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: Text(
                  data.residentAddress ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title:  Text("Resident Phone",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              trailing: Text(data.residentMsisdn ?? '',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
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
