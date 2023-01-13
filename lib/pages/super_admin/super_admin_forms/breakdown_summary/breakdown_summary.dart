import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magodo/models/break_down_summaryModel/breakdownSummaryModel.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../api/api.dart';
import '../../../../components/components_for_class_of_varable/userGroup.dart';
import '../../../../components/title.dart';

class BreakdownSummary extends StatefulWidget {
  ResidentModel? data;

  BreakdownSummary({Key? key, this.data}) : super(key: key);

  @override
  State<BreakdownSummary> createState() => _BreakdownSummaryState();
}

class _BreakdownSummaryState extends State<BreakdownSummary> {
  @override
  // ignore: must_call_super
  initState() {
    getBreakDownSummary();
  }

  BreakDownSummaries breakDownSummaries = BreakDownSummaries();

  getBreakDownSummary() async {
    var userGroup = widget.data?.usr_group;
    var zone = widget.data?.zone;
    String url = '';

    if (userGroup == UserGroup.SUPER_ADMIN) {
      url = 'summaryBreakdown';
    }
    url = 'summaryBreakdown?zone=$zone';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);
    print("this ${r}, ${userGroup}");

    setState(() {
      breakDownSummaries = BreakDownSummaries.fromJson(r);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          color: color.AppColor.residentBody,
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: [
              TitleContainer(
                title: 'Dashboard',
                data: widget.data,
              ),
              Container(
                color: color.AppColor.residentBody,
                padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
                child: Column(children: [

                  Row(
                    children: const [
                      Text(
                        "Breakdown Summary",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              const Divider(
                thickness: 2,
              ),
              Card(
                child: ListTile(

                  leading: const Icon(Icons.person),
                  title: const Text('Total  Members'),
                  trailing: Text('${breakDownSummaries.data?.totalMembers}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Total Family Members'),
                  trailing: Text('${breakDownSummaries.data?.totalFamilyMembers}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Total Staffs'),
                  trailing: Text('${breakDownSummaries.data?.totalStaffs}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Total Zonal Coordinators'),
                  trailing: Text('${breakDownSummaries.data?.totalCoordinators}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Total Property Owners'),
                  trailing: Text('${breakDownSummaries.data?.totalPropertyOwners}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Total Commercial Residents'),
                  trailing: Text('${breakDownSummaries.data?.totalCommercialResident}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
