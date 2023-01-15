import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/member_staffModel/view_memberStaffModel.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
class ViewMemberStaffCard extends StatelessWidget {
  MemberStaff data;

  ViewMemberStaffCard({Key? key, required this.data}) : super(key: key);

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
                data.dateLastModified ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                data.employmentStatus ?? '',
                style:  TextStyle(fontSize:  15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                data.empdateOrDob ?? '',
                style:  TextStyle(fontSize:  15.sp),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                    color: data.identityStatus == 'Verified'
                        ? color.AppColor.verifiedColor
                        : color.AppColor.decline,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(data.identityStatus ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            ListTile(
              title:  Text(
                'Dependant Name',
                style: TextStyle(fontSize:  15.sp),
              ),
              trailing: Text(
                data.dependantName ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                'Resident Code',
                style: TextStyle(fontSize:  15.sp),
              ),
              trailing: Text(
                data.residentCode ?? '',
                style:  TextStyle(fontSize:  15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                'Resident Phone',
                style: TextStyle(fontSize:  15.sp),
              ),
              trailing: Text(
                data.residentNo ?? '',
                style:  TextStyle(fontSize:  15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                'Dependant Phone',
                style: TextStyle(fontSize:  15.sp),
              ),
              trailing: Text(
                data.dependantPhone ?? '',
                style:  TextStyle(fontSize:  15.sp),
              ),
            ),
            ListTile(
              title:  Text(
                'Dependant Address',
                style: TextStyle(fontSize:  15.sp),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.dependantContacts ?? '',
                  style: TextStyle(fontSize:  15.sp),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Relationship',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                data.relationship ?? '',
                style: const TextStyle(fontSize: 15),
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
