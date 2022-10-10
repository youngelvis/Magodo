import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/date_text_field.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/time_text_field.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class EventRequest extends StatefulWidget {
  final data;

  const EventRequest({Key? key, required this.data}) : super(key: key);

  @override
  State<EventRequest> createState() => _EventRequestState();
}

TextEditingController _email = TextEditingController();
TextEditingController _mobileNumber = TextEditingController();
TextEditingController _scheduleDate = TextEditingController();
TextEditingController _scheduleTime = TextEditingController();

class _EventRequestState extends State<EventRequest> {
  String? eventType;
  final eventTypeOptions = [
    'Birthday',
    'Child Dedication',
    'Seminar',
    'Product Launching',
    'Job Recruiting Event',
    'Wedding',
    'Fashion show and red carpet',
    'others'
  ];
  String? population;
  final populationOptions = ['500', '400', '300', '200', '100', '50', '10'];
  Widget _buildEventType() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose event Type',
        style: TextStyle(fontSize: 15),
      ),
      value: eventType,
      onChanged: (value) => setState(() {
        eventType = value as String;
      }),
      items: eventTypeOptions.map(buildEventTypeItem).toList(),
    );
  }

  DropdownMenuItem<String> buildEventTypeItem(String eventTypeOptions) =>
      DropdownMenuItem(
        value: eventTypeOptions,
        child: Text(
          eventTypeOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );
  Widget _buildPopulationType() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose population',
        style: TextStyle(fontSize: 15),
      ),
      value: population,
      onChanged: (value) => setState(() {
        population = value as String;
      }),
      items: populationOptions.map(buildPopulationItem).toList(),
    );
  }

  DropdownMenuItem<String> buildPopulationItem(String populationOptions) =>
      DropdownMenuItem(
        value: populationOptions,
        child: Text(
          populationOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                GetPasscodeTitleContainer(
                  title: 'Event Request',
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
                              NameTextField(
                                  controller: _email,
                                  hint: "Enter email",
                                  nameType: "Email (Optional)"),
                              MobileNumberTextField(
                                  controller: _mobileNumber,
                                  fieldName: 'Mobile Number',
                                  hintText: 'Enter your mobile number'),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Schedule Date"),
                              CustomDatePicker(date: _scheduleDate),
                              const TextForForm(text: "Schedule Time"),
                              CustomTimePicker(
                                departureTime: _scheduleTime,
                                hint: 'select Schedule time',
                              ),
                              const TextForForm(text: "Event Type"),
                              _buildEventType(),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextForForm(text: "Population"),
                              _buildPopulationType(),
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