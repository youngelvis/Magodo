import 'package:flutter/material.dart';
import 'package:magodo/components/textfieldcontainer.dart';
import 'components_for_class_of_varable/colors.dart' as color;

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
    return TextFieldContainer(
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


    );
  }

}

