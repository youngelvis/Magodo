import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/landing_page/welcome_screen.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       builder:(context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magodo Estate App',
        theme: ThemeData(),
        home:  WelcomeScreen(),
      ),
      designSize: const Size(411,896),
    );

  }
}

