// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/settings_page/web_view.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class VehicleReportCard extends StatefulWidget {
  final mraReceiptNo,
      govAgency,
      carMake,
      vehicleCode,
      date,
      vehicleColour,
      vehicleModel,
      amountPaid,
      uploadedFile,
      declineMessage,
      docName, regNo;

  const VehicleReportCard(
      {Key? key,
      required this.mraReceiptNo,
      required this.govAgency,
      required this.carMake,
      required this.vehicleCode,
      required this.date,
      required this.vehicleColour,
      required this.vehicleModel,
      required this.amountPaid,
      required this.uploadedFile,
      required this.declineMessage,
      required this.docName, required this.regNo})
      : super(key: key);

  @override
  State<VehicleReportCard> createState() => _VehicleReportCardState();
}

class _VehicleReportCardState extends State<VehicleReportCard> {

  openFile() async{
    print(widget.uploadedFile);
    Navigator.push(context, MaterialPageRoute(builder:(context)=>  MobileWebView(data: widget.uploadedFile)));
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
              widget.date,
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text("MRA dues receipt No"),
            trailing: Text(widget.mraReceiptNo),
          ),
          ListTile(
            title: const Text('Vehicle Registration No'),
            trailing: Text(widget.regNo ?? ""),
          ),
          ListTile(
            title: const Text('Registration State'),
            trailing: Text(widget.govAgency),
          ),
          ListTile(
            title: const Text('Make'),
            trailing: Text(widget.carMake),
          ),
          ListTile(
            title: const Text('Vehicle Code'),
            trailing: Text(widget.vehicleCode),
          ),
          ListTile(
            title: const Text("Colour"),
            trailing: Text(widget.vehicleColour),
          ),
          ListTile(
            title: const Text("Model"),
            trailing: Text(widget.vehicleModel),
          ),
          ListTile(
            title: const Text("Amount Paid"),
            trailing: Text(widget.amountPaid),
          ),
          ListTile(
            title: const Text("Uploaded File"),
            trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child:
                    InkWell(onTap: openFile, child: Text(widget.docName, style: TextStyle(
                      color: color.AppColor.verifiedColor,
                    ),))),
          ),
          ListTile(
            title: const Text("Decline Message"),
            subtitle: Text(widget.declineMessage),
          ),
        ],
      ),
    );
  }
}
