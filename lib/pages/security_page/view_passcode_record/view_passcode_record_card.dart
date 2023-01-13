import 'package:flutter/material.dart';
import 'package:magodo/models/passcode_report_data_model/passcode_report_data_model.dart';

class ViewPasscodeRecordCard extends StatelessWidget {
  PasscodeReport data;

  ViewPasscodeRecordCard({Key? key, required this.data}) : super(key: key);

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
                data.createdDate ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                data.passcode ?? '',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                    color: data.doNotHonorStatus == 'Honor'
                        ? Colors.green
                        : Colors.red,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(data.doNotHonorStatus ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            ListTile(
              title: const Text("Visitor Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.visitorName ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Visitor Phone",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.visitorMsisdn ?? '-',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Resident Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.residentName ?? '-',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Resident Code",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.residentCode ?? '-',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Resident Address",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.residentAddress ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title: const Text("Resident Phone",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.residentMsisdn ?? '',
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
