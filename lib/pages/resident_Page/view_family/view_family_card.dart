import 'package:flutter/material.dart';
import 'package:magodo/components/action_page_button2.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class ViewFamilyCard extends StatelessWidget {
  final fullName, status, dependentCode, email, date;

  const ViewFamilyCard({
    Key? key,
    required this.fullName,
    required this.status,
    required this.dependentCode,
    required this.email,
    required this.date,
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
                style: const TextStyle(fontSize: 20),
              ),
              trailing: Text(
                status,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                dependentCode,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            ListTile(
              title: const Text(
                'Full Name',
                style: TextStyle(fontSize: 25),
              ),
              trailing: Text(
                fullName,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            ListTile(
              title: const Text(
                'Email',
                style: TextStyle(fontSize: 25),
              ),
              trailing: Text(
                email,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 25,
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
                  text: 'Edit',
                ),
              ],
            )
          ],
        ),
      ),
    );
  } //
}
