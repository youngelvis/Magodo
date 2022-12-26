// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:magodo/models/activity_log_reportModel/activity_log_reportModel.dart';
import '../../../../models/movement_register_reportModel/movement_register_reportModel.dart';

class ActivityLogReportCard extends StatelessWidget {
  ActivityLogReport data;

  ActivityLogReportCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              data.createdDate ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              data.otherDetails ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Full Name",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.fullName ?? "",
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Resident Code',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.residentCode ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Action Performed",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.action ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Action  Description",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.actionDescription ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              " Action By",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.actionUser ?? '',
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
