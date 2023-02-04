import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/settings_page/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';


class CustomListTile extends StatefulWidget {
  final prefixIcon;
  final text;
  final data;
  final colour;
  final size;

  const CustomListTile(
      {Key? key,
      this.prefixIcon,
      required this.text,
        this.colour,
       this.data,this.size})
      : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
 navigate(data) async{
    Navigator.push(context, MaterialPageRoute(builder:(context)=>  MobileWebView(data: data)));

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: Icon(
          widget.prefixIcon,
          size: 30.sp,
          color: widget.colour?? color.AppColor.landingPageTitle,
        ),
        title: Text(widget.text, style:  TextStyle(

            color: color.AppColor.landingPageTitle,
            fontSize:widget.size ?? 25.sp)),

        onTap:  ()async{
          await navigate(widget.data);
        },
      ),
      SizedBox(
        height: 20.h,
      ),
    ]);
  }
}
