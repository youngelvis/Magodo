import 'package:flutter/material.dart';
import 'package:magodo/models/resident_report_data_model/resident_report_data_model.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class ViewResidentRecordCard extends StatelessWidget {
  ResidentReport data;

  ViewResidentRecordCard({Key? key, required this.data}) : super(key: key);

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
              trailing: Text(
                data.residentType ?? '',
                style: TextStyle(
                    fontSize: 15, color: color.AppColor.homePageTheme),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(data.residentCode ?? ''),
            ),
            ListTile(
              trailing: Text(data.status ?? '',
                  style: TextStyle(
                      fontSize: 15,
                      backgroundColor: data.status == 'Verified'
                          ? Colors.green
                          : Colors.red)),
            ),
            ListTile(
              title: const Text("Resident Name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Text(data.fullName ?? '',
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            ListTile(
              title: const Text("Resident Address",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  data.address ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),

            ListTile(
              title: const Text("Zone",
                  style: TextStyle(fontSize: 15,)),
              trailing: Text(data.mraZone ?? '',
                  style: const TextStyle(fontSize: 15, )),
            ),
            ListTile(
              title: const Text("Validity End Date",
                  style: TextStyle(fontSize: 15, )),
              trailing: Text(data.validityEndsDate ?? '',
                  style: const TextStyle(fontSize: 15,)),
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
