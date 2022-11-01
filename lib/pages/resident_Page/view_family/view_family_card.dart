// ignore_for_file: prefer_typing_uninitialized_variables

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
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              date,
              style: const TextStyle(fontSize: 20),
            ),
            trailing: Text(
              status,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              dependentCode,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Full Name',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Email',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              email,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  } //
}
