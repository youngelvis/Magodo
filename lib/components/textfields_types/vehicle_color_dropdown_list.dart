import 'package:flutter/material.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildVehicleColorDropDownList extends StatefulWidget {
  final vehicleColor;
  final onChanged;

  const BuildVehicleColorDropDownList(
      {Key? key, required this.vehicleColor, required this.onChanged})
      : super(key: key);

  @override
  State<BuildVehicleColorDropDownList> createState() =>
      _BuildVehicleColorDropDownListState();
}

class _BuildVehicleColorDropDownListState
    extends State<BuildVehicleColorDropDownList> {
  final colourOptions = [
    'White',
    'Red',
    'Blue',
    'Green',
    'Grey',
    'Silver',
    'Brown',
    'Orange',
    'Yellow',
    'Light blue',
    'Tan',
    'Dark red',
    'Dark green',
    'Gold',
    'Purple',
    'Wine'
  ];

  Widget _buildVehicleColor() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Select vehicle color',
        style: TextStyle(fontSize: 15),
      ),
      value: widget.vehicleColor,
      onChanged: widget.onChanged,
      items: colourOptions.map(buildVehicleColorItem).toList(),
    );
  }

  DropdownMenuItem<String> buildVehicleColorItem(String vehicleColorOptions) =>
      DropdownMenuItem(
        value: vehicleColorOptions,
        child: Text(
          vehicleColorOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Vehicle Color"),
          _buildVehicleColor(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
