import 'package:flutter/material.dart';

import '../../../../models/member_staffModel/view_memberStaffModel.dart';


class ViewMemberStaffCard extends StatelessWidget {
  MemberStaff data;

  ViewMemberStaffCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              data.dateLastModified ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            trailing: Text(
              data.employmentStatus ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(
              data.staffPasscode??''
            ),
          ),
          ListTile(
            title: Text(
              data.empdateOrDob?? '',
              style: const TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.identityStatus ?? '',
            ),
          ),
          ListTile(
            title: const Text(
              'Dependant Name',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.dependantName ?? '',
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
              'Resident Phone',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.residentNo ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Dependant Phone',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.dependantPhone ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Dependant Address',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.dependantContacts ?? '',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            title: const Text(
              'Relationship',
              style: TextStyle(fontSize: 25),
            ),
            trailing: Text(
              data.relationship ?? '',
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