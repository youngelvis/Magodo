import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class ProfilePage extends StatefulWidget {
  final data;

  const ProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(
                        width: 105,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 90,
                height: 90,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profilePicture.jpeg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                const SizedBox(
                  width: 170,
                ),
                Text(
                  widget.data['usr_full_name'],
                  style: const TextStyle(fontSize: 20),
                ),
                const Icon(CupertinoIcons.pen)
              ]),
              const SizedBox(
                height: 10,
              ),
              Text(widget.data['usr_group']),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text('Status'),
                      trailing: widget.data['user_status'] == 'Verified'
                          ? Text(
                              widget.data['user_status'],
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor:
                                      color.AppColor.verifiedColor),
                            )
                          : Text(
                              widget.data['user_status'],
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor:
                                      color.AppColor.verifiedColor),
                            ),
                    ),
                    ListTile(
                      leading: const Text('Zone'),
                      trailing: Text(widget.data['zone']),
                    ),
                    ListTile(
                      leading: const Text('Classification'),
                      trailing: Text(widget.data['usr_group']),
                    ),
                    ListTile(
                      leading: const Text('Resident Type'),
                      trailing: Text(widget.data['resident_type']),
                    ),
                    ListTile(
                      leading: const Text('Address'),
                      trailing: Text(widget.data['address']),
                    ),
                    ListTile(
                      leading: const Text('Email'),
                      trailing: Text(widget.data['email']),
                    ),
                    ListTile(
                        leading: const Text('Mobile Number'),
                        trailing: Text(widget.data['msisdn'])),
                    ListTile(
                      leading: const Text('Validity Start'),
                      trailing: Text(widget.data['validity_starts']),
                    ),
                    ListTile(
                      leading: const Text('Validity ends'),
                      trailing: Text(widget.data['validity_ends']),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 70, left: 20, right: 20, bottom: 50),
                  child: ActionPageButton(
                      onPressed: () {}, text: "Update Profile"))
            ],
          ),
        ),
      ),
    );
  }
}
