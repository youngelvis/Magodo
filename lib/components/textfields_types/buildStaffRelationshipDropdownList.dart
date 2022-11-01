// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildRelationshipDropDownList extends StatefulWidget {
  final relationship;
  final onChanged;

  const BuildRelationshipDropDownList(
      {Key? key, required this.relationship, required this.onChanged})
      : super(key: key);

  @override
  State<BuildRelationshipDropDownList> createState() =>
      _BuildRelationshipDropDownListState();
}

class _BuildRelationshipDropDownListState
    extends State<BuildRelationshipDropDownList> {
  final relationshipOptions = [
    'House Help',
    'Security',
    'Driver',
    'Personal Assistance',
    'Gardener',
    'Others'
  ];

  Widget _buildRelationship() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select relationship',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.relationship,
      onChanged: widget.onChanged,
      items: relationshipOptions.map(buildRelationshipItem).toList(),
    );
  }

  DropdownMenuItem<String> buildRelationshipItem(String relationshipOptions) =>
      DropdownMenuItem(
        value: relationshipOptions,
        child: Text(
          relationshipOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const TextForForm(text: "Relationship"),
      _buildRelationship(),
          const SizedBox(
            height: 20,
          ),
    ]);
  }
}
