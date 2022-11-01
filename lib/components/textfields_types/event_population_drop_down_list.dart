// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildEventPopulationDropDownList extends StatefulWidget {
  final eventPopulation;
  final onChanged;

  const BuildEventPopulationDropDownList(
      {Key? key, required this.eventPopulation, required this.onChanged})
      : super(key: key);

  @override
  State<BuildEventPopulationDropDownList> createState() =>
      _BuildEventPopulationDropDownListState();
}

class _BuildEventPopulationDropDownListState
    extends State<BuildEventPopulationDropDownList> {
  final populationOptions = ['500', '400', '300', '200', '100', '50', '10'];
  Widget _buildEventPopulation() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select event population',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.eventPopulation,
      onChanged: widget.onChanged,
      items: populationOptions.map(buildEventTypeItems).toList(),
    );
  }

  DropdownMenuItem<String> buildEventTypeItems(String populationOptions) =>
      DropdownMenuItem(
        value: populationOptions,
        child: Text(
          populationOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "event Population"),
          _buildEventPopulation(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
