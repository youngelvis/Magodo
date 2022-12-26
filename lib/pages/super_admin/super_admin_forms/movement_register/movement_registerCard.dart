// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../../../../models/movement_register_reportModel/movement_register_reportModel.dart';

class MovementRegisterCard extends StatelessWidget {
  MovementRegisterReport data;

  MovementRegisterCard({Key? key, required this.data}) : super(key: key);

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
              data.passcode ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const ListTile(
            title: Text(
              "Visitor's Name",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              '',
              style: TextStyle(fontSize: 25),
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
              " Visitor's phone",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.visitorMsisdn ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Resident Phone",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.residentMsisdn ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Resident Name",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.residentFullName ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Time in",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.timeIn ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              "Time out",
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.timeOut ?? '',
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
