import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/models/fetch_member_model/fetch_MemberMainData.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';

import '../../../components/components_for_class_of_varable/userGroup.dart';

class SearchableDropDownList1 extends StatefulWidget {
  ResidentModel? data;
  final onChange;
  SearchableDropDownList1({Key? key, this.onChange, this.data}) : super(key: key);

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
     var userGroup = widget.data?.usr_group;
    var zone = widget.data?.zone;
    String url = '';

    if(userGroup == UserGroup.SUPER_ADMIN){
      url = 'fetchMember';
    }
    url = 'fetchMember?mra_zone=$zone';

      var res = await CallApi().getData(url);
      var r = jsonDecode(res.body);
      print("this ${r}");
    setState(() {
      fetchMemberMainData = FetchMemberMainData.fromJson(r);
    });
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
