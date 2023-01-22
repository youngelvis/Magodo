import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../models/commercial_event_request/commercial_event_requests.dart';

class CommercialEventRequestCard extends StatefulWidget {
  CommercialEventRequest? data;

  CommercialEventRequestCard({Key? key, this.data}) : super(key: key);

  @override
  State<CommercialEventRequestCard> createState() =>
      _CommercialEventRequestCardState();
}

class _CommercialEventRequestCardState
    extends State<CommercialEventRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text(
              widget.data?.createdDate ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Text(
              widget.data?.eventType ?? '',
              style: TextStyle(
                  fontSize: 12.sp, color: color.AppColor.homePageTheme),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              widget.data?.passcode ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          ListTile(
            title: Text(
              widget.data?.eventScheduledDate ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: widget.data?.status == 'Approved'
                      ? color.AppColor.verifiedColor
                      : widget.data?.status == 'Unapproved'
                          ? color.AppColor.homePageTheme
                          : color.AppColor.decline,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(widget.data?.status ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Name',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Text(
              widget.data?.fullname ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          ListTile(
            title: Text(
              'Phone',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Text(
              widget.data?.msisdn ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Text(
              widget.data?.email ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          ListTile(
            title: Text(
              'Population',
              style: TextStyle(fontSize: 12.sp),
            ),
            trailing: Text(
              widget.data?.population ?? '',
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ]),
      ),
    );
  }
}
