// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';

class RoundedDropDownTextField extends StatelessWidget {
  final hint;
  final value;
  final onChanged;
  final items;

  const RoundedDropDownTextField({
    Key? key,
    required this.hint,
    this.value,
    this.onChanged,
    this.items
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black12,
      child: TextFieldContainer(
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            isExpanded: true,
            hint: hint,
            value: value,
            items: items,
            onChanged: onChanged,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none
            ),
          ),
        ),


      ),
    );
  }

}

