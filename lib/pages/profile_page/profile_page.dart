// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/profile_page/edit_profile/edit_profile.dart';
import 'package:magodo/pages/settings_page/settings.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import '../../components/components_for_class_of_varable/username_password.dart';

class ProfilePage extends StatefulWidget {
  ResidentModel? data;

  ProfilePage({Key? key, this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imageData;

  initState() {
    getProfile();
  }

  late File? image;
  final _picker = ImagePicker();
  final String _url = "http://132.145.231.191/portal/mraLagosApp/api/";

  selectImage() async {
    try {
      final pickedFile = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
        sendImage();
      }
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
    return;
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
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  sendImage() async {
    var _apiUrl = "uploadPhoto";

    String fileName = image!.path.split('/').last;
    print(widget.data?.resident_code);
    print(fileName);
    print(image!.path);
    FormData formData = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(image!.path,
          filename: fileName, contentType: MediaType('image', "jpg")),
      "resident_code": widget.data?.resident_code
    });
    var dio = Dio();
    var username = UsernameAndPassword.API_USERNAME;
    var password = UsernameAndPassword.API_PASSWORD;
    var fullUrl = _url + _apiUrl;
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    dio.options.headers["Content-Type"] = 'multipart/form-data';
    dio.options.headers["authorization"] = basicAuth;

    final response = await dio.post(
      fullUrl,
      data: formData,
    );

    final responseBody = response.data;
    print(responseBody);
    setState(() {
      getProfile();
      callMessage(responseBody['message']);
    });


    return responseBody;
  }

  void getProfile() async {
    var residentCode = widget.data?.resident_code;
    var url = 'fetchUserPhoto/$residentCode';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);
    imageData = r['data']['file_path'];
    setState(() {


    });

    print(r);
  }

  chooseOption() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Choose Image'),
        content: SingleChildScrollView(
          child: ListBody(children: [
            InkWell(
              onTap: () {
                selectImage();
                Navigator.of(context).pop();

              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.image,
                      color: color.AppColor.homePageTheme,
                    ),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(fontSize: 18.sp),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.clear,
                      color: color.AppColor.homePageTheme,
                    ),
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30.h, left: 10.w, right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      SizedBox(
                        width: 90.w,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 50,
                            color: color.AppColor.landingPageTitle,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings(
                                          data: widget.data,
                                        )));
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                imageData == null
                    ? Stack(
                        children: [
                          SizedBox(
                            width: 115.w,
                            height: 115.h,
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/profileImage.jpg'),
                            ),
                          ),
                          Positioned(
                              top: 73.h,
                              left: 52.w,
                              child: RawMaterialButton(
                                padding: const EdgeInsets.all(5.0),
                                fillColor: color.AppColor.homePageTheme,
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  chooseOption();
                                },
                              ))
                        ],
                      )
                    : Stack(children: [
                        SizedBox(
                          width: 115.w,
                          height: 115.h,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imageData ?? ''),
                          ),
                        ),
                        Positioned(
                            top: 73.h,
                            left: 52.w,
                            child: RawMaterialButton(
                              padding: const EdgeInsets.all(5.0),
                              fillColor: color.AppColor.homePageTheme,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                chooseOption();
                              },
                            ))
                      ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(
                    width: 140.w,
                  ),
                  Text(
                    widget.data?.usr_full_name ?? '',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  IconButton(
                      icon: const Icon(CupertinoIcons.pen),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProfile(data: widget.data)));
                      })
                ]),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.data?.usr_group ?? ''),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Text('Status'),
                        trailing: Container(
                          decoration: BoxDecoration(
                              color: widget.data?.user_status == 'Verified'
                                  ? color.AppColor.verifiedColor
                                  : color.AppColor.decline,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(widget.data?.user_status ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text('Zone'),
                        trailing: Text(widget.data?.zone ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Classification'),
                        trailing: Text(widget.data?.category ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Resident Type'),
                        trailing: Text(widget.data?.resident_type ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Address'),
                        trailing: Text(widget.data?.address ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Email'),
                        trailing: Text(widget.data?.email ?? ''),
                      ),
                      ListTile(
                          leading: const Text('Mobile Number'),
                          trailing: Text(widget.data?.msisdn ?? '')),
                      ListTile(
                        leading: const Text('Validity Start'),
                        trailing: Text(widget.data?.validity_starts ?? ''),
                      ),
                      ListTile(
                        leading: const Text('Validity ends'),
                        trailing: Text(widget.data?.validity_ends ?? ''),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 70, left: 20, right: 20, bottom: 50),
                    child: ActionPageButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        data: widget.data,
                                      )));
                        },
                        text: "Update Profile"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
