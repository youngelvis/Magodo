import 'package:flutter/material.dart';

class ViewStaffCard extends StatelessWidget {
  final visitorsName,
      employementType,
      staffCode,
      employmentDate,
      dateOfBirth,
      staffMobile,
      date,
      contactDetails;

  const ViewStaffCard({
    Key? key,
    required this.visitorsName,
    required this.employementType,
    required this.staffCode,
    required this.employmentDate,
    required this.dateOfBirth,
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
              subtitle: Text(visitorsName),
            ),
            ListTile(
              title: const Text('Employment Date'),
              trailing: Text(employmentDate),
            ),
            ListTile(
              title: const Text('Date of Birth'),
              trailing: Text(dateOfBirth),
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
