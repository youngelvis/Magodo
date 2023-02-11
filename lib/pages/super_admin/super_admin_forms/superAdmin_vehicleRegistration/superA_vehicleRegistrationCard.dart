// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/settings_page/web_view.dart';
import '../../../../models/vehicle_dataModel/superAdminVehicleData.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SuperAdminVehicleReportCard extends StatefulWidget {
  FetchSuperAdminVehicle data;

  SuperAdminVehicleReportCard({Key? key, required this.data}) : super(key: key);

  @override
  State<SuperAdminVehicleReportCard> createState() =>
      _SuperAdminVehicleReportCardState();
}

class _SuperAdminVehicleReportCardState
    extends State<SuperAdminVehicleReportCard> {
  openFile() async {
    print(widget.data.doc);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MobileWebView(data: widget.data.doc)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.data.tstamp ?? '',
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text("MRA dues receipt No"),
            trailing: Text(widget.data.receiptNo ?? ''),
          ),
          ListTile(
            title: const Text('Gov agency'),
            trailing: Text(widget.data.govAgency ?? ""),
          ),
          ListTile(
            title: const Text('Make'),
            trailing: Text(widget.data.make ?? ""),
          ),
          ListTile(
            title: const Text('Vehicle Code'),
            trailing: Text(widget.data.vehicleNo ?? ''),
          ),
          ListTile(
            title: const Text("Colour"),
            trailing: Text(widget.data.color ?? ""),
          ),
          ListTile(
            title: const Text("Model"),
            trailing: Text(widget.data.model ?? ""),
          ),
          ListTile(
            title: const Text("Amount Paid"),
            trailing: Text(widget.data.amount ?? ""),
          ),
          ListTile(
            title: const Text("Uploaded File"),
            trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: InkWell(
                    onTap: openFile,
                    child: Text(
                      widget.data.docName ?? "",
                      style: TextStyle(
                        color: color.AppColor.verifiedColor,
                      ),
                    ))),
          ),
          ListTile(
            title: const Text("Decline Message"),
            trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: Text(
                  widget.data.declineMessage ?? "",
                  style: TextStyle(
                    color: color.AppColor.verifiedColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
