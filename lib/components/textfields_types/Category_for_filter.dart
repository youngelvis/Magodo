// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildCategoryForFilter extends StatefulWidget {
  final hintText;
  final residentType;
  final onChanged;

  const BuildCategoryForFilter(
      {Key? key, required this.residentType, required this.onChanged, this.hintText})
      : super(key: key);

  @override
  State<BuildCategoryForFilter> createState() =>
      _BuildCategoryForFilterState();
}

class _BuildCategoryForFilterState
    extends State<BuildCategoryForFilter> {
  final residentialOptions = [
    'Commercial',
    'Dependant',
    'Resident',
    'Property Owner',
  ];


  Widget _buildResidentType() {
    return RoundedDropDownTextField(
      hint:  Text(
        widget.hintText?? 'Select Category',
        style: TextStyle(fontSize: 15.sp),
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
          const TextForForm(text: "Category"),
          _buildResidentType(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}