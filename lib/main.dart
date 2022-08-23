import 'package:flutter/material.dart';
import 'components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/landing_page/welcome_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Magodo Estate App',
      theme: ThemeData(),
      home: const WelcomeScreen(),
    );

  }
}

