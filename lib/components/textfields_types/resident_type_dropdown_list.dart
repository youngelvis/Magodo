// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildResidentTypeDropDownList extends StatefulWidget {
 final hintText;
  final residentType;
  final onChanged;

  const BuildResidentTypeDropDownList(
      {Key? key, required this.residentType, required this.onChanged, this.hintText})
      : super(key: key);

  @override
  State<BuildResidentTypeDropDownList> createState() =>
      _BuildResidentTypeDropDownListState();
}

class _BuildResidentTypeDropDownListState
    extends State<BuildResidentTypeDropDownList> {
  final residentialOptions = [
    'Commercial',
    'Resident',
    'Property Owner',
  ];


  Widget _buildResidentType() {
    return RoundedDropDownTextField(
      hint:  Text(
        'Select resident type',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.residentType,
      onChanged: widget.onChanged,
      items: residentialOptions.map(buildResidentTypeItem).toList(),
    );
  }

  DropdownMenuItem<String> buildResidentTypeItem(String residentTypeOptions) =>
      DropdownMenuItem(
        value: residentTypeOptions,
        child: Text(
          residentTypeOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Resident Type"),
          _buildResidentType(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
