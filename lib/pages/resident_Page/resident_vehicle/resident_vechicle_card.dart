import 'package:flutter/material.dart';
import 'package:magodo/components/action_page_button2.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
class VehicleReportCard extends StatelessWidget {
  final mraReceiptNo,
      govAgency,
      carMake,
      vehicleCode,
      date,
      vehicleColour,
      vehicleModel,
      amountPaid,
      uploadedFile,
      declineMessage;

  const VehicleReportCard({
    Key? key,
    required this.mraReceiptNo,
    required this.govAgency,
    required this.carMake,
    required this.vehicleCode,
    required this.date,
    required this.vehicleColour,
    required this.vehicleModel,
    required this.amountPaid,
    required this.uploadedFile,
    required this.declineMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                date,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: const Text("MRA dues receipt No"),
              trailing: Text(mraReceiptNo),
            ),
            ListTile(
              title: const Text('Gov agency'),
              subtitle: Text(govAgency),
            ),
            ListTile(
              title: const Text('Make'),
              trailing: Text(carMake),
            ),
            ListTile(
              title: const Text('Vehicle Code'),
              trailing: Text(vehicleCode),
            ),
            ListTile(
              title: const Text("Colour"),
              trailing: Text(vehicleColour),
            ),
            ListTile(
              title: const Text("Model"),
              trailing: Text(vehicleModel),
            ),
            ListTile(
              title: const Text("Amount Paid"),
              trailing: Text(amountPaid),
            ),
            ListTile(
              title: const Text("Uploaded File"),
              trailing: Text(uploadedFile),
            ),
            ListTile(
              title: const Text("Decline Message"),
              subtitle: Text(declineMessage),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 45,
                ),
                ActionPageButton2(
                  onPressed: () {},
                  primaryColor: color.AppColor.decline,
                  text: 'Delete',
                ),
                const SizedBox(
                  width: 50,
                ),
                ActionPageButton2(
                  onPressed: () {},
                  primaryColor: color.AppColor.verifiedColor,
                  text: 'Update',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
