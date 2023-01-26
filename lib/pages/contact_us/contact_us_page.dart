import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/action_page_button2.dart';
import 'package:magodo/components/title.dart';
import '../../components/app_page_theme_action_button.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/text_for_form.dart';
import '../../components/textfieldcontainer.dart';
import '../../components/textfields_types/name_textfield.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _subject = TextEditingController();
TextEditingController _message = TextEditingController();

class _ContactUsPageState extends State<ContactUsPage> {
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
          hintText: 'message',
          border: InputBorder.none
            ),
          ),),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              TitleContainer(
                title: 'contact us',
              ),
              const SizedBox(
                height: 50,
              ),

              Expanded(
                child: OverflowBox(
                  child: SingleChildScrollView(
                    child: Form(

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
                              leading: Icon(Icons.quick_contacts_dialer_rounded),
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
                              onPressed: () {},
                              text: 'Send Message'),
                          SizedBox(
                            height: 20.h,
                          ),
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
