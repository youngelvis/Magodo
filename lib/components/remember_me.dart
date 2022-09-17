import 'package:flutter/material.dart';
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
    return Row(
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
        const Text(
          'Remember me',
          style: TextStyle(fontSize: 15, color: Colors.black26),
        ),
        const SizedBox(
          width: 80,
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
                fontSize: 20,
                color: color.AppColor.homeSecondaryTheme),
          ),
        )
      ],
    );
  }
}
