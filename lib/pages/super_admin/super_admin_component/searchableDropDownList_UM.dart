import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/models/fetch_member_model/fetch_MemberMainData.dart';

class SearchableDropDownList1 extends StatefulWidget {
  const SearchableDropDownList1({Key? key}) : super(key: key);

  @override
  State<SearchableDropDownList1> createState() =>
      _SearchableDropDownList1State();
}

class _SearchableDropDownList1State extends State<SearchableDropDownList1> {
  FetchMemberMainData? fetchMemberMainData = FetchMemberMainData();

  @override
  // ignore: must_call_super
  initState() {
    getData();
  }

  void getData() async {
    var res = await CallApi().getData('fetchMember');
    var r = jsonDecode(res.body);
    setState(() {
      fetchMemberMainData = FetchMemberMainData.fromJson(r);
    });
  }

  onSelectionChanged(String? s){
    print(s?.split(" - "));
    var residentCode = s?.split("- ");
    print(residentCode?[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItems: true,
          items: fetchMemberMainData?.data
              ?.map((e) => "${e?.RESIDENT_CODE} - ${e?.FULL_NAME}")
              .toList(),
          dropdownSearchDecoration: const InputDecoration(
              labelText: "Select Resident", hintText: "select resident"),
          showSearchBox: true,
          onChanged: onSelectionChanged,
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
