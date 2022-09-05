import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedTextDateInput.dart';
import 'package:magodo/components/text_for_form.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class GetBulkPasscode extends StatefulWidget {
  const GetBulkPasscode({Key? key}) : super(key: key);

  @override
  State<GetBulkPasscode> createState() => _GetBulkPasscodeState();
}

class _GetBulkPasscodeState extends State<GetBulkPasscode> {
  TextEditingController _date = TextEditingController();
  TextEditingController _arrivalTime = TextEditingController();
  TextEditingController _departureTime = TextEditingController();

  _buildArrivalDate() {
    return RoundedTextDateInput(
      hintText: 'mm/dd/yy',
      controller: _date,
      onTap: () async {
        DateTime? _datePicker = await showDatePicker(
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
        if (_datePicker != null) {
          String formattedDate = DateFormat("MM/dd/yyyy").format(_datePicker);
          setState(() {
            _date.text = formattedDate.toString();
            print(_date.toString());
          });
        } else {
          print('select date');
        }
      },
      icon: Icons.calendar_month_rounded,
    );
  }

  _buildArrivalTime() {
    return RoundedTextDateInput(
      hintText: 'time of arrival',
      controller: _arrivalTime,
      onTap: () async {
        TimeOfDay? _timePicker = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: 12, minute: 30),
        );
        if (_timePicker != null) {
          setState(() {
            _arrivalTime.text = _timePicker.format(context);
            print(_arrivalTime.text);
          });
        } else {
          return;
        }
      },
      icon: Icons.access_time,
    );
  }

  _buildDepartureTime() {
    return RoundedTextDateInput(
      hintText: 'time of departure',
      controller: _departureTime,
      onTap: () async {
        TimeOfDay? _timePicker = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 12, minute: 30),
        );
        if (_timePicker != null) {
          setState(() {
            _departureTime.text = _timePicker.format(context);
            print(_departureTime.text);
          });
        } else {
          return;
        }
      },
      icon: Icons.access_time,
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                const GetPasscodeTitleContainer(
                  title: 'Get Passcode',
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Get Bulk Passcode',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextForForm(text: "Arrival Date"),
                              _buildArrivalDate(),
                              const TextForForm(text: "Arrival Time"),
                              _buildArrivalTime(),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextForForm(text: "Departure Time"),
                              _buildDepartureTime(),
                              const SizedBox(
                                height: 30,
                              ),
                              ActionPageButton(
                                  onPressed: () {}, text: 'Get Passcode'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
