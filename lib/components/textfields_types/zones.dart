// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/zones.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';

class BuildZoneDropDownList extends StatefulWidget {
  final zone;
  final onChanged;
  final hint;

  const BuildZoneDropDownList(
      {Key? key, required this.zone, required this.onChanged, this.hint})
      : super(key: key);

  @override
  State<BuildZoneDropDownList> createState() =>
      _BuildZoneDropDownListState();
}

class _BuildZoneDropDownListState
    extends State<BuildZoneDropDownList> {
  final zoneOptions = [
    Zones.AEA,
    Zones.AGBOOLA_AJUMOBI,
    Zones.AKIN_TIJANI,
    Zones.BASHEER_SHITTU,
    Zones.BROADWAY,
    Zones.CENTRAL,
    Zones.FAA,
    Zones.FILLING_EGDE,
    Zones.FORESHORE,
    Zones.GORGE_VIEW,
    Zones.KAYODE_TAIWO,
    Zones.KOLA_AMODU,
    Zones.MAINLINE,
    Zones.NELSON_NWEKE,
    Zones.OGUNYE,
    Zones.PALM_VIEW,
    Zones.PEACE_VALLEY,
    Zones.PSSDC_WALE_TAIWO,
    Zones.SOUTH_EAST,
    Zones.SOUTH_WEST,
    Zones.VALLEY_VIEW
  ];

  Widget _buildZone() {
    return RoundedDropDownTextField(
      hint:  Text(
        widget.hint ?? 'Select zone',
        style: const TextStyle(fontSize: 15),
      ),
      value: widget.zone,
      onChanged: widget.onChanged,
      items: zoneOptions.map(buildZoneItem).toList(),
    );
  }

  DropdownMenuItem<String> buildZoneItem(String zoneOptions) =>
      DropdownMenuItem(
        value: zoneOptions,
        child: Text(
          zoneOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextForForm(text: "Zone"),
          _buildZone(),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
