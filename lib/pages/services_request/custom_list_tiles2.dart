import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;

class CustomListTile2 extends StatelessWidget {
  final prefixIcon;
  final text;
  final data;
  final text2;

  const CustomListTile2(
      {Key? key,
      required this.prefixIcon,
      required this.text,
      required this.data,
      required this.text2})
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
          subtitle: Text(text2, style: const TextStyle(fontSize: 40)),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
