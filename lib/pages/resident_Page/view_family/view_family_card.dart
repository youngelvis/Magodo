import 'package:flutter/material.dart';

class ViewFamilyCard extends StatelessWidget {
  final fullName, status, dependentCode, email, date;

  const ViewFamilyCard({
    Key? key,
    required this.fullName,
    required this.status,
    required this.dependentCode,
    required this.email,
    required this.date,
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
                status,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(dependentCode),
            ),
            ListTile(
              title: const Text('Full Name'),
              trailing: Text(fullName),
            ),
            ListTile(
              title: const Text('Email'),
              trailing: Text(email),
            ),
          ],
        ),
      ),
    );
  } //
}
