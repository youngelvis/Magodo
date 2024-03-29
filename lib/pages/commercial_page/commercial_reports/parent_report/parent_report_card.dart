import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../models/fetch_parents_models/fetch_parents_model.dart';

class ParentReportCard extends StatefulWidget {
  GetParent? data;

  ParentReportCard({Key? key, this.data}) : super(key: key);

  @override
  State<ParentReportCard> createState() => _ParentReportCardState();
}

class _ParentReportCardState extends State<ParentReportCard> {
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
                widget.data?.dateCreated ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                widget.data?.residentCode ?? '',
                style: TextStyle(fontSize: 15.sp),

              ),

            ),
            ListTile(
              title: Text(
                'Validity start',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(widget.data?.validityStarts ?? ''),
              ),
            ListTile(
              title: Text(
                'Validity Ends',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(widget.data?.validityEnds ?? ''),
            ),
            ListTile(
              title: Text(
                'Business Name',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.businessName ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Parent's address",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  widget.data?.parentAddress ?? '',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Resident name",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.residentName ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Parent Name",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.parentName ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Parent Passcode",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.parentPasscode ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "parent's phone",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.parentMobile ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                "Zone",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data?.zone ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
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
