import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/login_page/login_page.dart';

import '../../components/components_for_class_of_varable/colors.dart' as color;


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
                        height: 510.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                          image: const AssetImage('assets/magodo2.jpeg'))
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 15.h,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: color.AppColor.landingPage2),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100.h,
                              ),

                              SizedBox(
                                height: 120.h
                              ),
                              Container(
                                width: 350.w,
                                height: 75.h,
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
                                          fontSize: 20.sp),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder:(context)=> const SignIN()));
                                    }),

                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 140.h,
                width: 250.w,
                height: 600.h,
                left: 77.w,
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),

              Positioned(
                left: 50.w,
                top:620.h,
                child: Text(
                  'Welcome To Magodo',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25.0.sp,
                    letterSpacing: 1.5.sp,
                    color: color.AppColor.landingPageTitle,
                  ),
                ),
              ),
              Positioned(
                left: 135.w,
                top:660.h,
                child: Text(
                  'Phase II',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25.0.sp,
                    letterSpacing: 1.5.sp,
                    color: color.AppColor.landingPageTitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
