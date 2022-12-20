import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class UploadPicture extends StatefulWidget {
  const UploadPicture({Key? key}) : super(key: key);

  @override
  State<UploadPicture> createState() => _UploadPictureState();

}

class _UploadPictureState extends State<UploadPicture> {
  late File? image;
  final _picker = ImagePicker();
  final String _url = "http://132.145.231.191/portal/mraLagosApp/api/";

  selectImage() async {
    var _apiUrl = "uploadPhoto";

    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
    try {
      String fileName = image!
          .path
          .split('/')
          .last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image!.path, filename: fileName,
            contentType: MediaType('image', "*/*")),
        "type": "image/jpeg"
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
      return responseBody;
    } catch (e) {}
  }


  @override
  Widget build(BuildContext context) {
    return Column();
  }
}