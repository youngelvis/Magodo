import 'package:flutter/material.dart';
import 'package:magodo/components/text_button_nav_page.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class ResidentNavigationPage extends StatelessWidget {
  const ResidentNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Row(
          children: [
            Container(
                color: color.AppColor.homePageTheme,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
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
                        onPressed: () {}),
                    SizedBox(
                      height: 50,
                    ),
                    NavTextButton(
                        icon: Icons.speed, text: 'Dashboard', onPressed: () {}),
                    NavTextButton(
                        icon: Icons.directions_car,
                        text: 'Register Vehicle',
                        onPressed: () {}),
                    NavTextButton(
                        icon: Icons.access_time_filled_sharp,
                        text: 'Event Request',
                        onPressed: () {}),
                    NavTextButton(
                        icon: Icons.insert_chart,
                        text: 'Report',
                        onPressed: () {}),
                    NavTextButton(
                        icon: Icons.shopping_bag,
                        text: 'Get Passcode',
                        onPressed: () {}),
                    NavTextButton(
                        icon: Icons.family_restroom,
                        text: 'Family',
                        onPressed: () {}),
                    NavTextButton(
                        icon: Icons.engineering,
                        text: 'Staffs',
                        onPressed: () {}),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
