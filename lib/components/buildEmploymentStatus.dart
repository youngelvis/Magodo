import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildEmploymentDropDownList extends StatefulWidget {
  final employment;
  final onChanged;

  const BuildEmploymentDropDownList(
      {Key? key, required this.employment, required this.onChanged})
      : super(key: key);

  @override
  State<BuildEmploymentDropDownList> createState() =>
      _BuildEmploymentDropDownListState();
}

class _BuildEmploymentDropDownListState
    extends State<BuildEmploymentDropDownList> {
  final employmentOptions = [
    'Employed',
    'Resigned',
    'Dismissed',
    'Terminated',
    'Absconded',
    'Family',
    'Others'
  ];

  Widget _buildEmploymentStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select employment',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.employment,
      onChanged: widget.onChanged,
      items: employmentOptions.map(buildEmploymentItem).toList(),
    );
  }

  DropdownMenuItem<String> buildEmploymentItem(String employmentOptions) =>
      DropdownMenuItem(
        value: employmentOptions,
        child: Text(
          employmentOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Employment Status"),
          _buildEmploymentStatus(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
