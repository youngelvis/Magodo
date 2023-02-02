// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/components_for_class_of_varable/category.dart';

class BuildCategoryDropDownList extends StatefulWidget {
  final category;
  final onChanged;
  final hint;

  const BuildCategoryDropDownList(
      {Key? key, required this.category, required this.onChanged, this.hint})
      : super(key: key);

  @override
  State<BuildCategoryDropDownList> createState() =>
      _BuildCategoryDropDownListState();
}

class _BuildCategoryDropDownListState
    extends State<BuildCategoryDropDownList> {
  final categoryOptions = [
    Category.SCHOOL,
    Category.CHURCH,
    Category.GYM_HOUSE,
    Category.HOSPITAL,
    Category.HOTEL,
    Category.ENTERTAINMENT,
    Category.MOSQUE,
    Category.OFFICE,
    Category.RESTAURANT,
    Category.SALOON,
    Category.SUPER_MARKET,
  ];


  Widget _buildCategory() {
    return RoundedDropDownTextField(
      hint:  Text(
        widget.hint?? 'Select Category',
        style: const TextStyle(fontSize: 15),
      ),
      value: widget.category,
      onChanged: widget.onChanged,
      items: categoryOptions.map(buildCategoryItem).toList(),
    );
  }

  DropdownMenuItem<String> buildCategoryItem(String categoryOptions) =>
      DropdownMenuItem(
        value: categoryOptions,
        child: Text(
          categoryOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Category"),
          _buildCategory(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
