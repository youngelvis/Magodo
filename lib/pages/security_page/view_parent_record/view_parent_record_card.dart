import 'package:flutter/material.dart';
import 'package:magodo/models/parent_report_data_model/parent_report_data_model.dart';
class ViewParentRecordCard extends StatelessWidget {
  ParentReport data;
   ViewParentRecordCard({Key? key, required this.data}) : super(key: key);

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

            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(data.parentPasscode ?? ''),
            ),
            ListTile(
              title: Text(data.status ?? '',
                  style: TextStyle(
                      fontSize: 15,
                      backgroundColor: data.status == 'verified'
                          ? Colors.green
                          : Colors.red)),
            ),
            ListTile(
              title: const Text("Resident Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.residentName ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Parent Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.parentName ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Parent Phone",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.parentMobile ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Parent Address",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.parentAddress ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title: const Text("Business Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.businessName ?? '-',
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
    );
  }
}
