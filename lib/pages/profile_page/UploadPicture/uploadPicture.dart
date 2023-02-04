import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';

class UploadPicture extends StatefulWidget {
  ResidentModel? data;
   UploadPicture({Key? key, this.data}) : super(key: key);

  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  late File? image;
  final _picker = ImagePicker();
  final String _url = "http://132.145.231.191/portal/mraLagosApp/api/";

  selectImage() async {
    try{
      final pickedFile = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } on PlatformException catch (e){
      print('failed to pick image: $e');
    }
    return;
  }

  sendImage() async {
    var _apiUrl = "uploadPhoto";

    String fileName = image!.path.split('/').last;
    print(fileName);
    print(image!.path);
    FormData formData = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(image!.path,
          filename: fileName, contentType: MediaType('image', "jpg")),

      "resident_code": widget.data?.resident_code

    });
    var dio = Dio();
    var username = 'test';
    var password = 'benard@1991';
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
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100
                  ),
                  ActionPageButton(
                      onPressed: () {
                        selectImage();
                      },
                      text: 'select image'),
                  ActionPageButton(
                      onPressed: () {
                        sendImage();
                      },
                      text: 'send image'),
                ],
              ),
            )));
  }
}
