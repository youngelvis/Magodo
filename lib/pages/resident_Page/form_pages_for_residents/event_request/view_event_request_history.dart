import 'package:flutter/material.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class ViewEventRequestHistory extends StatelessWidget {
  final fullName,
      familyType,
      mobileNumber,
      email,
      eventType,
      populationNumber,
      date,
      status,
      dateRequested;

  const ViewEventRequestHistory({
    Key? key,
    required this.fullName,
    required this.familyType,
    required this.mobileNumber,
    required this.email,
    required this.eventType,
    required this.populationNumber,
    required this.date,
    required this.dateRequested,
    required this.status,
  }) : super(key: key);

  statusBuilder() {
    if (status == 'approved') {
      return Text(
        status,
        style: TextStyle(
            color: Colors.white, backgroundColor: color.AppColor.verifiedColor),
      );
    } else if (status == 'pending') {
      return Text(
        status,
        style: TextStyle(
            color: Colors.white, backgroundColor: color.AppColor.homePageTheme),
      );
    } else {
      return Text(
        status,
        style:
            const TextStyle(color: Colors.white, backgroundColor: Colors.red),
      );
    }
  }

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
              trailing: Text(
                familyType,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
                title: Text(
                  dateRequested,
                  style: const TextStyle(fontSize: 13),
                ),
                trailing: statusBuilder()),
            ListTile(
              title: const Text('Full Name'),
              subtitle: Text(fullName),
            ),
            ListTile(
              title: const Text('Email'),
              trailing: Text(email),
            ),
            ListTile(
              title: Text(mobileNumber),
            ),
            ListTile(
              title: const Text('Date of Birth'),
              trailing: Text(eventType),
            ),
            ListTile(
              title: const Text('Dependent Phone'),
              trailing: Text(populationNumber),
            ),
          ],
        ),
      ),
    );
  } //

}
