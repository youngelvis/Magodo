import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Future<void> navigate(data) async{
    var url =data;
    if(await canLaunchUrl(Uri.parse(url))){
      await launch(url,
        forceWebView: true,
        forceSafariVC: true,
      );

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
          size: 30.sp,
          color: color.AppColor.landingPageTitle,
        ),
        title: Text(text, style:  TextStyle(
            color: color.AppColor.landingPageTitle ,
            fontSize: 30.sp)),

        onTap:  ()async{
          await navigate(data);
        },
      ),
      const SizedBox(height: 20,),
    ]);
  }
}
