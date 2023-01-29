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
            title: const Text('Visitor Name'),
            subtitle: Text(visitorsName),
          ),
          ListTile(
            title: const Text("Visitor Passcode"),
            trailing: Text(visitorCode),
          ),
          ListTile(
            title: const Text('Resident Name'),
            trailing: Text(residentName),
          ),
          ListTile(
            title: const Text('Address'),
            trailing: Text(address),
          ),
          ListTile(
            title: const Text('Resident Phone'),
            trailing: Text(residentMobile),
          ),
          ListTile(
            title: const Text("visitor's mobile number"),
            trailing: Text(visitorMobile),
          ),
        ],
      ),
    ),
  );
}
