import 'package:flutter/material.dart';

class Passcode extends StatelessWidget {
  final mraPasscode,
      employementType,
      visitorName,
      guestNumber,
      zone,
      expires,
      date,
      contactDetails;

  const Passcode({
    Key? key,
    required this.mraPasscode,
    required this.employementType,
    required this.visitorName,
    required this.guestNumber,
    required this.zone,
    required this.expires,
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
              ),

            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: const Text("Name"),
              trailing: Text(visitorName),
            ),
            ListTile(
              title: const Text('Mra Passcode'),
              subtitle: Text(mraPasscode),
            ),
            ListTile(
              title: const Text('Guest'),
              trailing: Text(guestNumber),
            ),
            ListTile(
              title: const Text('Zone'),
              trailing: Text(zone),
            ),
            ListTile(
              title: const Text('Expires'),
              trailing: Text(expires),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
