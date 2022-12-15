import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SendMessagesButtons extends StatefulWidget {
  final data;
  final residentCode;

  SendMessagesButtons({Key? key, this.data, this.residentCode})
      : super(key: key);

  @override
  State<SendMessagesButtons> createState() => _SendMessagesButtonsState();
}

class _SendMessagesButtonsState extends State<SendMessagesButtons> {
  whatApp() async {
    final data = await Services().sendWhatsappPasscode(
        widget.data['data']['visitor_number'],
        widget.data['message'],
        widget.residentCode!);

    print("this is message:${data}");
    Uri whatsapp = Uri.parse(data['data']['url']);
    await launchUrl(whatsapp,
    mode: LaunchMode.externalApplication);
  }

  sendSMSPasscode() async {
    final data = await Services().sendSMSPasscode(
        widget.data['data']['visitor_number'],
        widget.data['message'],
        widget.residentCode!);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: whatApp,
            style: ElevatedButton.styleFrom(
                primary: color.AppColor.homePageBackground,
                onPrimary: Colors.grey),
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.whatsapp),
                SizedBox(
                  width: 10,
                ),
                Text('WhatsApp'),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: sendSMSPasscode,
            style: ElevatedButton.styleFrom(
                primary: color.AppColor.homePageBackground,
                onPrimary: Colors.grey),
            child: Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.sms),
                SizedBox(
                  width: 10,
                ),
                Text('Sms'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
