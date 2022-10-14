import 'package:flutter/material.dart';
import 'package:magodo/components/text_button_nav_page.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/add_family/add_family.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/add_staff/add_staff.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_bulk_passcode/get_bulk_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_future_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_passcode/get_passcode.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/register_vechicle.dart';
import 'package:magodo/pages/resident_Page/resident_page_landing_page.dart';
import 'package:magodo/pages/resident_Page/view_family/view_family_report.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;

class ResidentNavigationPage extends StatelessWidget {
  final data;
  const ResidentNavigationPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Row(
          children: [
            Container(
                color: color.AppColor.homePageTheme,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width /1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 50,
                          color: color.AppColor.landingPage2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                   const SizedBox(
                      height: 50,
                    ),
                    NavTextButton(
                        icon: Icons.speed, text: 'Dashboard', onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResidentPageLandingPage(data: data)));
                    }),

                    NavTextButton(
                        icon: Icons.directions_car,
                        text: 'Register Vehicle',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterVehicle(data: data)));
                        }),
                    NavTextButton(
                        icon: Icons.access_time_filled_sharp,
                        text: 'Event Request',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResidentPageLandingPage(data: data)));
                        }),
                    NavTextButton(
                        icon: Icons.insert_chart,
                        text: 'View Family Members',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFamilyMembers(data: data,)));
                        }),
                    NavTextButton(
                        icon: Icons.shopping_bag,
                        text: 'Get Passcode',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GetPasscode(data: data,)));
                        }),
                    NavTextButton(
                        icon: Icons.shopping_bag,
                        text: 'Get Bulk Passcode',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GetBulkPasscode(data: data,)));
                        }),
                    NavTextButton(
                        icon: Icons.shopping_bag,
                        text: 'Get Future Passcode',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GetFuturePasscode(data: data,)));
                        }),
                    NavTextButton(
                        icon: Icons.family_restroom,
                        text: 'Family',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFamily(data: data,)));
                        }),
                    NavTextButton(
                        icon: Icons.engineering,
                        text: 'Staffs',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddStaff(data: data,)));
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
