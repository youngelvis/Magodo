// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../components/title.dart';
import '../../../../models/resident_data_model/residentdata.dart';
import '../get_passcode/get_passcode.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SendMessagesButtons extends StatefulWidget {
  final data;
  ResidentModel? response;

  SendMessagesButtons({Key? key, this.data, required this.response})
      : super(key: key);

  @override
  State<SendMessagesButtons> createState() => _SendMessagesButtonsState();
}

class _SendMessagesButtonsState extends State<SendMessagesButtons> {
  whatApp() async {
    final data = await Services().sendWhatsappPasscode(
        widget.data['data']['visitor_number'],
        widget.data['message'],
        widget.response?.resident_code);
    Uri whatsapp = Uri.parse(data['data']['url']);
    await launchUrl(whatsapp, mode: LaunchMode.externalApplication);
  }

  callMessage(message) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder:(context)=>  GetPasscode(data: widget.response,)));
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  sendSMSPasscode() async {

    var data = await Services().sendSMSPasscode(
        widget.data['data']['visitor_number'],
        widget.data['message'],
        widget.response?.resident_code);

    var message = data['message'];
    callMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    var qcode = widget.data['data']['qrcode'];
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(
            children: [
              TitleContainer(
                title: 'Dashboard',
                data: widget.response,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Share Passcode',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: OverflowBox(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(right: 25.w, left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            width:  MediaQuery.of(context).size.width,
                            height: 90.h,
                            child: ElevatedButton(
                              onPressed: sendSMSPasscode,
                              style: ElevatedButton.styleFrom(
                                  primary: color.AppColor.homePageTheme,
                                  onPrimary: color.AppColor.homePageBackground),
                              child: Row(
                                children:  [

                                  Icon(Icons.sms,size: 40.sp,),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text('SMS Passcode',style: TextStyle(fontSize: 25.sp)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            width:  MediaQuery.of(context).size.width,
                            height: 90.h,

                            child: ElevatedButton(
                              onPressed: whatApp,
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  onPrimary: Colors.white),
                              child: Row(
                                children:  [

                                  Icon(Icons.whatsapp,color: Colors.white,size: 40.sp,),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text('WhatsApp',style: TextStyle(fontSize: 25.sp),),
                                ],
                              ),
                            ),
                          ),


                          qcode != null
                              ?

                            Container(
                              width: 300.0,
                              height: 300.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(qcode),
                                  fit: BoxFit.cover,
                                ),

                                // your own shape
                                shape: BoxShape.rectangle,
                              ),
                            )

                              : const Text("empty"),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
