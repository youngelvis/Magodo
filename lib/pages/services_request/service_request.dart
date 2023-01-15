import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/pages/services_request/custom_list_tiles2.dart';

class ServiceRequest extends StatefulWidget {
  final data;

  const ServiceRequest({Key? key, required this.data}) : super(key: key);

  @override
  State<ServiceRequest> createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequest> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: GetPasscodeTitleContainer(
                  title: 'Change Password',
                  data: widget.data,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Card(
              child: Column(
                children: const [
                  CustomListTile2(
                    prefixIcon: CupertinoIcons.creditcard_fill,
                    text: 'NIMIC Verification',
                    data: 'data',
                    text2: 'coming soon',
                  ),
                  CustomListTile2(
                    prefixIcon: CupertinoIcons.lock_fill,
                    text: 'Bills Payment',
                    data: 'data',
                    text2: 'coming soon',
                  ),
                  CustomListTile2(
                    prefixIcon: CupertinoIcons.question_circle,
                    text: 'Emergency Services',
                    data: 'data',
                    text2: 'coming soon',
                  ),
                  CustomListTile2(
                    prefixIcon: CupertinoIcons.exclamationmark_circle_fill,
                    text: 'HandyMan Services',
                    data: 'data',
                    text2: 'coming soon',
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
