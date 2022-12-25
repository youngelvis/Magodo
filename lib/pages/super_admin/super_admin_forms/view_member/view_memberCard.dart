// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/models/view_memberModel/view_memberModel.dart';

class ViewMemberCard extends StatelessWidget {
  ViewMemberModel data;

  ViewMemberCard({Key? key, required this.data}) : super(key: key);

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
            trailing: Text(
              data.residentType ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              "${data.validityStartsDate ?? ''} - ${data.validityEndsDate ?? ''}",
              style: const TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.status ?? '',
            ),
          ),
          ListTile(
            title: const Text(
              'Name',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.fullName ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Email',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.email ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Address',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.address ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Zone',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.mraZone ?? '',
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
