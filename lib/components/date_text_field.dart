// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
import 'components_for_class_of_varable/colors.dart' as color;
class CustomDatePicker extends StatefulWidget {
  final date;
  const CustomDatePicker({Key? key, required this.date}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return RoundedTextDateInput(
      hintText: 'mm/dd/yy',
      controller: widget.date,
      onTap: () async {
        DateTime? datePicker = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: color.AppColor.homePageTheme, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: color.AppColor.homePageTheme, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (datePicker != null) {
          String formattedDate = DateFormat("MM/dd/yyyy").format(datePicker);
          setState(() {
            widget.date.text = formattedDate.toString();

          });
        }
      },
      icon: Icons.calendar_month_rounded,
    );
  }
}
