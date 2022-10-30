import 'package:flutter/material.dart';
class ViewStaffCard extends StatefulWidget {
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
  State<ViewStaffCard> createState() => _ViewStaffCardState();
}

class _ViewStaffCardState extends State<ViewStaffCard> {


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
                widget.date,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: Text(
                widget.employementType,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: const Text("staff Passcode"),
              trailing: Text(widget.staffCode),
            ),
            ListTile(
              title: const Text('Staff Name'),
              trailing: Text(widget.staffName),
            ),
            ListTile(
              title: const Text('Employment Date'),
              trailing: Text(widget.employmentDate),
            ),
            ListTile(
              title: const Text('Validity Ends'),
              trailing: Text(widget.validityEnds),
            ),
            ListTile(
              title: const Text('Staff Phone'),
              trailing: Text(widget.staffMobile),
            ),
            ListTile(
              title: const Text("Contact/Other Detailsd"),
              trailing: Text(widget.contactDetails),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
