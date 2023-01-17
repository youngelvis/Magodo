import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:magodo/models/fetch_parent_model/get_parent_model.dart';
import 'package:magodo/models/fetch_parents_models/fetch_parents_model.dart';

import '../../../../api/api.dart';
import '../../../../models/resident_data_model/residentdata.dart';

class SelectParentDropdown extends StatefulWidget {
  ResidentModel? data;
  final onChange;
   SelectParentDropdown({Key? key, this.data, this.onChange}) : super(key: key);

  @override
  State<SelectParentDropdown> createState() => _SelectParentDropdownState();
}
class _SelectParentDropdownState extends State<SelectParentDropdown> {
  FetchParents? fetchParent;

  @override
  // ignore: must_call_super
  initState() {
    getData();
  }

  void getData() async {
    var residentCode = widget.data?.resident_code;
    String url = '';


    url = 'fetchParent/$residentCode';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);
    setState(() {
      fetchParent = FetchParents.fromJson(r);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItems: true,
          items: fetchParent?.data
              ?.map((e) => "${e?.parentPasscode} - ${e?.parentName}")
              .toList(),
          dropdownSearchDecoration: const InputDecoration(
              hintText: "select staff"),
          showSearchBox: true,
          onChanged: widget.onChange,
          searchFieldProps: const TextFieldProps(
            cursorColor: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}