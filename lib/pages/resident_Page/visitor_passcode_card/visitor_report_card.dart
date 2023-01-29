import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/resident_Page/resident_components/do_not_honour.dart';

class VisitorPasscodeReport extends StatelessWidget {
  final visitorsName,
      residentName,
      address,
      residentMobile,
      visitorMobile,
      visitorCode,
      date;

  VisitorPasscodeReport({
    Key? key,
    required this.visitorsName,
    required this.residentName,
    required this.address,
    required this.residentMobile,
    required this.visitorMobile,
    required this.visitorCode,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              SizedBox(
                width: 15.sp,
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: DoNotHonour(
              passcode: visitorCode,
            ),
          ),
          ListTile(
            title: Text('Visitor Name', style: TextStyle(fontSize: 15.sp),),
            subtitle: Text(visitorsName, style: TextStyle(fontSize: 15.sp),),
          ),
          ListTile(
            title:  Text("Visitor Passcode", style: TextStyle(fontSize: 15.sp),),
            trailing: Text(visitorCode, style: TextStyle(fontSize: 15.sp),),
          ),
          ListTile(
            title:  Text('Resident Name', style: TextStyle(fontSize: 15.sp),),
            trailing: Text(residentName, style: TextStyle(fontSize: 15.sp),),
          ),
          ListTile(
            title: Text('Address', style: TextStyle(fontSize: 15.sp),),
            trailing: Text(address, style: TextStyle(fontSize: 15.sp),),
          ),
          ListTile(
            title:  Text('Resident Phone', style: TextStyle(fontSize: 15.sp),),
            trailing: Text(residentMobile, style: TextStyle(fontSize: 15.sp),),
          ),
          ListTile(
            title: Text("visitor's mobile number", style: TextStyle(fontSize: 15.sp),),
            trailing: Text(visitorMobile, style: TextStyle(fontSize: 15.sp),),
          ),
        ],
      ),
    ),
  );
}
