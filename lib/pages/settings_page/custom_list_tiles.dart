import 'package:flutter/material.dart';
import '../../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';

class CustomListTile extends StatelessWidget {
  final prefixIcon;
  final text;
  final data;

  const CustomListTile(
      {Key? key,
      this.prefixIcon,
      required this.text,
       this.data})
      : super(key: key);

  navigate(data) async{
    if(await canLaunchUrl(data)){
      await launchUrl(data);
    } else{
      throw 'could not lunch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
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
        onTap: navigate(data),
      ),
      const SizedBox(height: 20,),
    ]);
  }
}
