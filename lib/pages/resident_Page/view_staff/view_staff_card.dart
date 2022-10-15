import 'package:flutter/material.dart';

class ViewStaffCard extends StatelessWidget {
  final staffName,
      employementType,
      staffCode,
      employmentDate,
      validityEnds,
      staffMobile,
      date,
      contactDetails;

  const ViewStaffCard({
    Key? key,
    required this.staffName,
    required this.employementType,
    required this.staffCode,
    required this.employmentDate,
    required this.validityEnds,
    required this.staffMobile,
    required this.date,
    required this.contactDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                date,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: Text(
                employementType,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: const Text("staff Passcode"),
              trailing: Text(staffCode),
            ),
            ListTile(
              title: const Text('Staff Name'),
              trailing: Text(staffName),
            ),
            ListTile(
              title: const Text('Employment Date'),
              trailing: Text(employmentDate),
            ),
            ListTile(
              title: const Text('Validity Ends'),
              trailing: Text(validityEnds),
            ),
            ListTile(
              title: const Text('Staff Phone'),
              trailing: Text(staffMobile),
            ),
            ListTile(
              title: const Text("Contact/Other Detailsd"),
              trailing: Text(contactDetails),
            ),
          ],
        ),
      ),
    );
  }
}
