// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/eventType_drop_down_list.dart';
import 'package:magodo/components/textfields_types/event_population_drop_down_list.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';
import '../../../../components/title.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class EventRequest extends StatefulWidget {
  ResidentModel? data;

  EventRequest({Key? key, required this.data}) : super(key: key);

  @override
  State<EventRequest> createState() => _EventRequestState();
}

TextEditingController _scheduleDate = TextEditingController();
TextEditingController _scheduleTime = TextEditingController();

class _EventRequestState extends State<EventRequest> {
  String? eventType;

  String? population;
  callMessage(message){


    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }
  requestEvent() async {
    if (_scheduleDate.text.isEmpty || _scheduleTime.text.isEmpty) {
      final data = await Services().requestEvent(widget.data?.resident_code,
          population, _scheduleDate.text, _scheduleTime.text, eventType);
      callMessage(data["error"]["message"]);

    }
    final data = await Services().requestEvent(widget.data?.resident_code,
        population, _scheduleDate.text, _scheduleTime.text, eventType);
    callMessage(data["message"]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                TitleContainer(
                  title: 'Dashboard',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Event request form',
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextForForm(text: "Schedule Date"),
                              CustomDatePicker(date: _scheduleDate),
                              const TextForForm(text: "Schedule Time"),
                              CustomTimePicker(
                                departureTime: _scheduleTime,
                                hint: 'select Schedule time',
                              ),
                              BuildEventTypeDropDownList(
                                eventType: eventType,
                                onChanged: (value) => setState(() {
                                  eventType = value as String;
                                }),
                              ),
                              BuildEventPopulationDropDownList(
                                eventPopulation: population,
                                onChanged: (value) => setState(() {
                                  population = value as String;
                                }),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ActionPageButton(
                                  onPressed: () async {},
                                  text: 'Submit Request'),
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
