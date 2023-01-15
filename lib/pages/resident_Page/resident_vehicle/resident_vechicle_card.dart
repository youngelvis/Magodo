// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VehicleReportCard extends StatelessWidget {
  final mraReceiptNo,
      govAgency,
      carMake,
      vehicleCode,
      date,
      vehicleColour,
      vehicleModel,
      amountPaid,
      uploadedFile,
      declineMessage;

  const VehicleReportCard({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              date,
              style:  TextStyle(fontSize: 13.sp),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text("MRA dues receipt No"),
            trailing: Text(mraReceiptNo),
          ),
          ListTile(
            title: const Text('Gov agency'),
            subtitle: Text(govAgency),
          ),
          ListTile(
            title: const Text('Make'),
            trailing: Text(carMake),
          ),
          ListTile(
            title: const Text('Vehicle Code'),
            trailing: Text(vehicleCode),
          ),
          ListTile(
            title: const Text("Colour"),
            trailing: Text(vehicleColour),
          ),
          ListTile(
            title: const Text("Model"),
            trailing: Text(vehicleModel),
          ),
          ListTile(
            title: const Text("Amount Paid"),
            trailing: Text(amountPaid),
          ),
          ListTile(
            title: const Text("Uploaded File"),
            trailing: Text(uploadedFile),
          ),
          ListTile(
            title: const Text("Decline Message"),
            subtitle: Text(declineMessage),
          ),
        ],
      ),
    );
  }
}
