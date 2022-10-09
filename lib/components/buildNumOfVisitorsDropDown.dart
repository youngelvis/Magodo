import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildNumberOfEmploymentDropDownList extends StatefulWidget {
  final noOfVisitors;
  final onChanged;

  const BuildNumberOfEmploymentDropDownList(
      {Key? key, required this.noOfVisitors, required this.onChanged})
      : super(key: key);

  @override
  State<BuildNumberOfEmploymentDropDownList> createState() =>
      _BuildNumberOfEmploymentDropDownListState();
}

class _BuildNumberOfEmploymentDropDownListState
    extends State<BuildNumberOfEmploymentDropDownList> {
  final noOfVisitorsOptions = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  Widget _buildNoOfVisitorsStatus() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select number of visitors',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.noOfVisitors,
      onChanged: widget.onChanged,
      items: noOfVisitorsOptions.map(buildNoOfVisitorsItem).toList(),
    );
  }

  DropdownMenuItem<String> buildNoOfVisitorsItem(String noOfVisitorsOptions) =>
      DropdownMenuItem(
        value: noOfVisitorsOptions,
        child: Text(
          noOfVisitorsOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Number of person's coming with visitor?"),
          _buildNoOfVisitorsStatus(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
