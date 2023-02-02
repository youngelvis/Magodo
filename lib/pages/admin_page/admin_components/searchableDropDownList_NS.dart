import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/models/fetch_member_model/fetch_MemberMainData.dart';
import 'package:magodo/models/fetch_staff_model/fetch_staff_model.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../../components/components_for_class_of_varable/userGroup.dart';

class SearchableDropDownListForMemberStaff extends StatefulWidget {
  ResidentModel? data;
  final onChange;
  SearchableDropDownListForMemberStaff({Key? key, this.onChange, this.data}) : super(key: key);

  @override
  State<SearchableDropDownListForMemberStaff> createState() =>
      _SearchableDropDownListForMemberStaffState();
}

class _SearchableDropDownListForMemberStaffState extends State<SearchableDropDownListForMemberStaff> {
  FetchStaffs? fetchStaffs;

  @override
  // ignore: must_call_super
  initState() {
    getData();
  }
  var sessionManager = SessionManager();
  void getData() async {
     var userGroup = widget.data?.usr_group;
    var zone = widget.data?.zone;
    String url = '';

    if(userGroup == UserGroup.SUPER_ADMIN){
      url = 'fetchEmployedStaffs';
    }
    url = 'fetchEmployedStaffs/$zone';

      var res = await CallApi().getData(url);
      var r = jsonDecode(res.body);

    setState(() {
      fetchStaffs = FetchStaffs.fromJson(r);

    });
     await sessionManager.set('data', fetchStaffs?.data);
  }

  onChange(String? s) async {
    var residentCode = s?.split("- ");
    String? name = residentCode?[1];

    for (FetchStaff item in fetchStaffs?.data ?? []) {
      if (item.dependantName == name?.trim()) {
        await sessionManager.set('Guid', item.guid);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        DropdownSearch<String>(

          mode: Mode.MENU,
          showSelectedItems: true,
          items: fetchStaffs?.data
              ?.map((e) => "${e.staffPasscode} - ${e.dependantName} - ${e.guid}")
              .toList(),
          dropdownSearchDecoration: const InputDecoration(
               hintText: "select staff"),
          showSearchBox: true,
          onChanged:  widget.onChange,
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
