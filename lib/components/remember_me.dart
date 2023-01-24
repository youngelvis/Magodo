import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/forget_password_page/forget_Password.dart';
import 'components_for_class_of_varable/colors.dart' as color;
class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}
bool isChecked = false;
class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor:
                color.AppColor.homePageTheme),
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              activeColor: color.AppColor.homePageTheme,
              checkColor: Colors.white,
            ),
          ),
           Text(
            'Remember me',
            style: TextStyle(fontSize: 15.sp, color: Colors.black26),
          ),
           SizedBox(
            width: 50.w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPassword(),
                ),
              );
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: color.AppColor.homeSecondaryTheme),
            ),
          )
        ],
      ),
    );
  }
}
