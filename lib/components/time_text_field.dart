import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
class CustomTimePicker extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final departureTime;
  // ignore: prefer_typing_uninitialized_variables
  final hint;
  const CustomTimePicker({Key? key, required this.departureTime, required this.hint}) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedTextDateInput(
          hintText: widget.hint,
          controller: widget.departureTime,
          onTap: () async {
            TimeOfDay? timePicker = await showTimePicker(
              context: context,
              initialTime: const TimeOfDay(hour: 12, minute: 30),
            );
            if (timePicker != null) {
              setState(() {
                widget.departureTime.text = timePicker.format(context);
              });
            } else {
              return;
            }
          },
          icon: Icons.access_time,
        ),
        SizedBox(
          height: 20.h,
        ),

      ],
    );
  }
}
