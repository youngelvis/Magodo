import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/services/services.dart';
import '../../components/app_page_theme_action_button.dart';
import '../../models/resident_data_model/residentdata.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/text_for_form.dart';
import '../../components/textfields_types/name_textfield.dart';

class ContactUsPage extends StatefulWidget {
  ResidentModel? data;

  ContactUsPage({Key? key, this.data}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _subject = TextEditingController();
TextEditingController _message = TextEditingController();

class _ContactUsPageState extends State<ContactUsPage> {
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
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  sendMessage() async {
    if (_fullName.text.isEmpty ||
        _email.text.isEmpty ||
        _subject.text.isEmpty ||
        _message.text.isEmpty) {
      var data = await Services()
          .contactUs(_email.text, _fullName.text, _subject.text, _message.text);
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    var data = await Services()
        .contactUs(_email.text, _fullName.text, _subject.text, _message.text);
    print(data);
    var message = data['message'];

    callMessage(message);
    _fullName.clear();
    _email.clear();
    _subject.clear();
    _message.clear();
  }

  _buildMessageBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextForForm(
          text: 'Message',
        ),
        Container(
          decoration: BoxDecoration(
            color: color.AppColor.landingPage2,
          ),
          child: TextFormField(
            minLines: 2,
            maxLines: 5,
            controller: _message,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'message', border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 25.w,
              ),
              TitleContainer(
                data: widget.data,
                title: 'contact us',
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: OverflowBox(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Container(
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Card(
                              child: ListTile(
                                leading: Icon(Icons.location_on_rounded),
                                title: Text('Location'),
                                subtitle: Text('Magodo GRA, Lagos'),
                              ),
                            ),
                            const Card(
                              child: ListTile(
                                leading:
                                    Icon(Icons.quick_contacts_dialer_rounded),
                                title: Text('Phone'),
                                subtitle: Text('+234 803 7750941'),
                              ),
                            ),
                            const Card(
                              child: ListTile(
                                leading: Icon(Icons.email),
                                title: Text('Email'),
                                subtitle: Text('magodoresidentsasso@gmail.com'),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                                child: Text(
                              "Get In Touch",
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(
                              height: 40,
                            ),
                            NameTextField(
                                controller: _fullName,
                                hint: 'Full Name',
                                nameType: "Full Name"),
                            NameTextField(
                                controller: _email,
                                hint: 'email',
                                nameType: "Email"),
                            NameTextField(
                                controller: _subject,
                                hint: 'Subject',
                                nameType: "Subject"),
                            _buildMessageBox(),
                            SizedBox(
                              height: 20.h,
                            ),
                            ActionPageButton(
                                onPressed: () {
                                  sendMessage();
                                }, text: 'Send Message'),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
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
