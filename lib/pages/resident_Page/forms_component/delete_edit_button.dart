import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/action_page_button2.dart';

class DeleteUpdateButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onPressedDeleteButton;
  final onPressedUpdateButton;

  const DeleteUpdateButton(
      {Key? key,
      required this.onPressedDeleteButton,
      required this.onPressedUpdateButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 45,
            ),
            ActionPageButton2(

              onPressed: onPressedDeleteButton,
              primaryColor: color.AppColor.decline,
              text: 'Delete',
            ),
            SizedBox(
              width: 60.w,
            ),
            ActionPageButton2(
              onPressed: onPressedUpdateButton,
              primaryColor: color.AppColor.verifiedColor,
              text: 'Edit',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
