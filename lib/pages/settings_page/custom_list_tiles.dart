import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class CustomListTile extends StatelessWidget {
  final prefixIcon;
  final text;
  final data;

  const CustomListTile(
      {Key? key,
      required this.prefixIcon,
      required this.text,
      required this.data})
      : super(key: key);

  navigate(data) {}

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: navigate(data),
        child: ListTile(
          leading: Icon(
            prefixIcon,
            size: 50,
            color: color.AppColor.landingPageTitle,
          ),
          title: Text(text, style: const TextStyle(fontSize: 40)),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 50,
            color: color.AppColor.landingPageTitle,
          ),
        ),
      ),
      const SizedBox(height: 20,),
    ]);
  }
}
