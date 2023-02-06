import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../components/components_for_class_of_varable/colors.dart'
    as color;

class MobileWebView extends StatefulWidget {
  final data;

  MobileWebView({Key? key, this.data}) : super(key: key);

  @override
  State<MobileWebView> createState() => _MobileWebViewState();
}

class _MobileWebViewState extends State<MobileWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54, //OR Colors.red or whatever you want
        ),
        backgroundColor: color.AppColor.homePageBackground,
      ),
      body: widget.data != null
          ? WebView(
              initialUrl: widget.data,
            )
          : const Center(child: Text('Page could not be reached!!')),
    );
  }
}
