import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';

class ResidentPageLandingPage extends StatefulWidget {
  final data;
    const ResidentPageLandingPage({Key? key, required this.data }) : super(key: key);

  @override
  State<ResidentPageLandingPage> createState() => _ResidentPageLandingPageState();
}

class _ResidentPageLandingPageState extends State<ResidentPageLandingPage> {



  @override

  Widget build(BuildContext context) {
    var data = widget.data;
    return Container(
      child: Text('Resident page'),
    );
  }
}
