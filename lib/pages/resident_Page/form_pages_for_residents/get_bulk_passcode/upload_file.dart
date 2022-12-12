import 'package:flutter/material.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:flutter/cupertino.dart';

class UploadFile extends StatelessWidget {
  final onPressed;

  const UploadFile({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Row(
            children: [
              const Text("Upload File"),
              const SizedBox(width: 10,),
              Icon(CupertinoIcons.exclamationmark_circle_fill,
              color: color.AppColor.homePageTheme,),

            ],
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)

            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("11 digits mobile numbers on each row"),
                const Text("of an excel sheet"),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 40,
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: color.AppColor.homeSecondaryTheme,
                            onPrimary: color.AppColor.landingPage2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        onPressed: onPressed,
                        child: const Text('Browse'))),

              ],
            ),
          ),

        ],
      );
  }
}
