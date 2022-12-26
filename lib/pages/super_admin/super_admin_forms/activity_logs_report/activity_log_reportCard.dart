// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:magodo/models/activity_log_reportModel/activity_log_reportModel.dart';
import '../../../../models/movement_register_reportModel/movement_register_reportModel.dart';

class ActivityLogReportCard extends StatelessWidget {
  final createdDate,
      otherDetails,
      fullName,
      residentCode,
      action,
      actionDescription,
      actionUser;

  const ActivityLogReportCard(
      {Key? key,
      required this.actionDescription,
      required this.action,
      required this.actionUser,
      required this.fullName,
      required this.createdDate,
      required this.residentCode,
      required this.otherDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                createdDate,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                otherDetails,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                "Full Name",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                fullName,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                'Resident Code',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                residentCode,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                "Action Performed",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                action,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                " Action By",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                actionUser,
                style: const TextStyle(fontSize: 15),
              ),
            ),
             ListTile(
              title: const Text("Action Description"),
              subtitle: Text(
                actionDescription,
                style: const TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  } //
}
