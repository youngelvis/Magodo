import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/settings_page/web_view.dart';
import 'components_for_class_of_varable/colors.dart' as color;

class TermsAndConditions extends StatefulWidget {
  final value, onChanged;

  const TermsAndConditions(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  openFile() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MobileWebView(
                data: "https://www.iubenda.com/privacy-policy/87719302")));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            data: Theme.of(context)
                .copyWith(unselectedWidgetColor: color.AppColor.homePageTheme),
            child: Checkbox(
              value:widget.value,
              onChanged: widget.onChanged,
              activeColor: color.AppColor.homePageTheme,
              checkColor: Colors.white,
            ),
          ),
          Text(
            'I agree to the',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          TextButton(
            onPressed: () {
              openFile();
            },
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                color: color.AppColor.verifiedColor,
                fontSize: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
