import 'package:flutter/material.dart';
import 'package:magodo/pages/resident_Page/resident_components/do_not_honour.dart';

class VisitorPasscodeReport extends StatelessWidget {
  final visitorsName,
      residentName,
      address,
      residentMobile,
      visitorMobile,
      visitorCode;

  VisitorPasscodeReport({
    Key? key,
    required this.visitorsName,
    required this.residentName,
    required this.address,
    required this.residentMobile,
    required this.visitorMobile,
    required this.visitorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(

        child: Column(
          children: [
            Row(
              children: [
                ListTile(
                  leading: Text(visitorCode),

                ),
              ],
            ),
            ListTile(
              leading: const Text('Resident Name'),
              trailing: Text(residentName),
            ),
            ListTile(
              leading: const Text('Address'),
              trailing: Text(address),
            ),
            ListTile(
              leading: const Text('Resident Phone'),
              trailing: Text(residentMobile),
            ),
            ListTile(
              leading: const Text('Visitor Name'),
              trailing: Text(visitorsName),
            ),
            ListTile(
              leading: const Text('Resident Name'),
              trailing:Text(visitorMobile),
            ),
          ],
        ),
      );
}
