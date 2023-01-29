import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/add_family_data_model/familydata.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class UpdateFamily extends StatefulWidget {
  ResidentModel? data;
  Family response;

  UpdateFamily({Key? key, required this.data, required this.response})
      : super(key: key);

  @override
  State<UpdateFamily> createState() => _UpdateFamilyState();
}

TextEditingController _mobileNumber = TextEditingController();
TextEditingController _fullName = TextEditingController();
TextEditingController _email = TextEditingController();

class _UpdateFamilyState extends State<UpdateFamily> {
  @override
  Widget build(BuildContext context) {
    _updateFamily() async {
      var data = await Services().updateFamily(
        widget.response.residentCode,
        _fullName.text.isEmpty ? widget.response.fullName : _fullName.text,
        _mobileNumber.text.isEmpty
            ? widget.response.dependantPhone
            : _mobileNumber.text,
        _email.text.isEmpty ? widget.response.email : _email.text,
      );

      var message = data['message'];

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

    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding:  EdgeInsets.only(top: 20.h, left: 10.w,),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                 SizedBox(
                  height: 40.h,
                ),
                Row(
                  children:  [
                    Text(
                      'Update Family',
                      style: TextStyle(fontSize: 30.sp),
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
                        padding:  EdgeInsets.only(right:10.w, ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameTextField(
                                  controller: _fullName,
                                  hint: "${widget.response.fullName}",
                                  nameType: "Full Name"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: 'Mobile number',
                                  hintText:
                                      ' ${widget.response.dependantPhone}'),
                              NameTextField(
                                  controller: _email,
                                  hint: "${widget.response.email}",
                                  nameType: "Email"),
                              const SizedBox(
                                height: 40,
                              ),
                              ActionPageButton(
                                  onPressed: () async {
                                    await _updateFamily();
                                  },
                                  text: 'update Family'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
