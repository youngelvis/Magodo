// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/view_memberModel/view_memberModel.dart';
import '../authorize_member.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../components/action_page_button2.dart';

class ViewMemberCard extends StatefulWidget {
  final userGroup;
  ViewMemberModel data;

  ViewMemberCard({Key? key, required this.data, this.userGroup})
      : super(key: key);

  @override
  State<ViewMemberCard> createState() => _ViewMemberCardState();
}

class _ViewMemberCardState extends State<ViewMemberCard> {
  onAuthorised() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        AuthorizeMember(response: widget.data, userGroup: widget.userGroup,)));
  }

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
                widget.data.createdDate ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.residentType ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('Final Authorized', style: TextStyle(fontSize: 15.sp),),
              trailing: ActionPageButton2(
                height: 45.h,
                onPressed: () {
                  onAuthorised();
                },
                primaryColor: color.AppColor.verifiedColor,
                text: 'Authorize',
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                "${widget.data.validityStartsDate ?? ''} - ${widget.data
                    .validityEndsDate ?? ''}",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.status ?? '',
              ),
            ),
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.fullName ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.email ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: Text(
                'Address',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: Text(
                  widget.data.address ?? '',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Zone',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.mraZone ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: const Text(
                'Validity Start Date',
              ),
              trailing: Text(
                widget.data.validityStartsDate ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            ListTile(
              title: const Text(
                'Validity End Date',
              ),
              trailing: Text(
                widget.data.validityEndsDate ?? '',
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
