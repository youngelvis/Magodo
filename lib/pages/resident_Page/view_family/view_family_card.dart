import 'package:flutter/material.dart';
class ViewFamilyCard extends StatelessWidget {
  final fullName,
      familyType,
      dependentCode,
      email,
      dateOfBirth,
      dependentMobile,
      date,
      contactDetails;
  const ViewFamilyCard({Key? key,
    required this.fullName,
    required this.familyType,
    required this.dependentCode,
    required this.email,
    required this.dateOfBirth,
    required this.dependentMobile,
    required this.date,
    required this.contactDetails,}) : super(key: key);

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
                familyType,
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
              subtitle: Text(fullName),
            ),
            ListTile(
              title: const Text('Email'),
              trailing: Text(email),
            ),
            ListTile(
              title: const Text('Date of Birth'),
              trailing: Text(dateOfBirth),
            ),
            ListTile(
              title: const Text('Dependent Phone'),
              trailing: Text(dependentMobile),
            ),

          ],
        ),
      ),
    );
  }//
}
