import 'package:flutter/material.dart';
import 'package:magodo/pages/login_page/login_page.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../login_page2/login_page2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Stack(
          children: [
            Positioned(
              child: Container(
                color: color.AppColor.homePageBackground,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 450,
                      decoration: BoxDecoration(
                        color: color.AppColor.landingPage,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: color.AppColor.landingPage2),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Text(
                              'Welcome To Magodo',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 35.0,
                                letterSpacing: 1.5,
                                color: color.AppColor.landingPageTitle,
                              ),
                            ),
                            const SizedBox(
                              height: 120
                            ),
                            Container(
                              width: 360,
                              height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: color.AppColor.homePageTheme,
                                    onPrimary: color.AppColor.landingPage2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                    )
                                  ),
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color:
                                            color.AppColor.landingPage2,
                                        fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=> const SignIN()));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 140,
              width: 450,
              height: 600,
              left: 20,
              child: Center(
                child: Image(
                  image: AssetImage('assets/house_PNG7.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
