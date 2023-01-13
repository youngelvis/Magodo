// ignore_for_file: prefer_typing_uninitialized_variables



import 'package:flutter/material.dart';
import 'package:magodo/models/view_memberModel/view_memberModel.dart';
import '../authorize_member.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../components/action_page_button2.dart';

class ViewMemberCard extends StatefulWidget {
  final userGroup;
  ViewMemberModel data;

  ViewMemberCard({Key? key, required this.data, this.userGroup}) : super(key: key);

  @override
  State<ViewMemberCard> createState() => _ViewMemberCardState();
}

class _ViewMemberCardState extends State<ViewMemberCard> {
    onAuthorised() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorizeMember(response: widget.data, userGroup: widget.userGroup,)));
    }

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
                widget.data.createdDate ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.residentType ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            ActionPageButton2(
              onPressed: () {
                onAuthorised();
              },
              primaryColor: color.AppColor.verifiedColor,
              text: 'Authorize',
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                "${widget.data.validityStartsDate ?? ''} - ${widget.data.validityEndsDate ?? ''}",
                style: const TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.status ?? '',
              ),
            ),
            ListTile(
              title: const Text(
                'Name',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.fullName ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                'Email',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.email ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                'Address',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  widget.data.address ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Zone',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.mraZone ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                'Validity Start Date',
              ),
              trailing: Text(
                widget.data.validityStartsDate ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              title: const Text(
                'Validity End Date',
              ),
              trailing: Text(
                widget.data.validityEndsDate ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  } }
