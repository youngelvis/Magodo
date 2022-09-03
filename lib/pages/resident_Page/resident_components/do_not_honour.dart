import 'package:flutter/material.dart';
import 'package:magodo/services/services.dart';
import '/../../../components/components_for_class_of_varable/colors.dart' as color;

class DoNotHonour extends StatefulWidget {
  final passcode;

  const DoNotHonour({Key? key, required this.passcode}) : super(key: key);

  @override
  State<DoNotHonour> createState() => _DoNotHonourState();
}

class _DoNotHonourState extends State<DoNotHonour> {
  bool isChecked = false;
  _changeHandler()  async {
    if(isChecked){
      await Services().doNotHonor(widget.passcode, 'true');
    }
    else{
      await Services().doNotHonor(widget.passcode, 'false');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Do not honour',
        ),
        Theme(
          data: Theme.of(context)
              .copyWith(unselectedWidgetColor: color.AppColor.homePageTheme),
          child: Checkbox(
            value: isChecked,
            onChanged: (value) async {
              setState(() {
                isChecked = value!;
              });
              await _changeHandler();
            },
            activeColor: color.AppColor.homePageTheme,
            checkColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
