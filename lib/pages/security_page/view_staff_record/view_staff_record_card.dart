import 'package:flutter/material.dart';
import 'package:magodo/models/staff_report_data_model/staff_report_data_model.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ViewStaffRecordCard extends StatelessWidget {
  StaffReport data;

  ViewStaffRecordCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                data.dateCreated ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              trailing: Text(
                data.employmentStatus ?? '',
                style: TextStyle(
                    fontSize: 15, color: color.AppColor.homePageTheme),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(data.staffPasscode ?? ''),
            ),
            ListTile(
              trailing: Text(data.identityStatus ?? '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      backgroundColor: data.identityStatus == 'verified'
                          ? Colors.green
                          : Colors.red)),
            ),
            ListTile(
              title: const Text("Dependant Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.dependantName ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Dependant Address",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.dependantContacts ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title: const Text("Dependant Phone",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.dependantPhone ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Relationship",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.relationship ?? '-',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("date of employment",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.empdateOrDob ?? '-',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Zone",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.zone ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Validity End Date",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.validityEnds ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );}
}
