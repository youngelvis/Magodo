// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildEventTypeDropDownList extends StatefulWidget {
  final eventType;
  final onChanged;

  const BuildEventTypeDropDownList(
      {Key? key, required this.eventType, required this.onChanged})
      : super(key: key);

  @override
  State<BuildEventTypeDropDownList> createState() =>
      _BuildEventTypeDropDownListState();
}

class _BuildEventTypeDropDownListState
    extends State<BuildEventTypeDropDownList> {
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
  Widget _buildEventType() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select event type',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.eventType,
      onChanged: widget.onChanged,
      items: eventTypeOptions.map(buildEventTypeItems).toList(),
    );
  }

  DropdownMenuItem<String> buildEventTypeItems(String eventTypeOptions) =>
      DropdownMenuItem(
        value: eventTypeOptions,
        child: Text(
          eventTypeOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "event Type"),
          _buildEventType(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
