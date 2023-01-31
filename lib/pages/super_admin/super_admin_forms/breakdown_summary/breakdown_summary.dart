import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    if (userGroup == UserGroup.SUPER_ADMIN || userGroup == UserGroup.ADMIN) {
      url = 'summaryBreakdown';
    }else
    {
      url = 'summaryBreakdown?zone=$zone';
    }

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
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                child: Column(children: [

                  Row(
                    children: [
                      Text(
                        "Breakdown Summary",
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ]),
              ),
              const Divider(
                thickness: 2,
              ),
              Card(
                child: ListTile(

                  leading:  Icon(Icons.person, color: color.AppColor.homePageTheme,),
                  title: const Text('Total  Members'),
                  trailing: Text('${breakDownSummaries.data?.totalMembers}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: color.AppColor.homePageTheme,),
                  title: const Text('Total Family Members'),
                  trailing: Text('${breakDownSummaries.data?.totalFamilyMembers}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: color.AppColor.homePageTheme,),
                  title: const Text('Total Staffs'),
                  trailing: Text('${breakDownSummaries.data?.totalStaffs}'),
                ),
              ),
              Card(

                child: ListTile(
                  leading: Icon(Icons.person, color: color.AppColor.homePageTheme,),
                  title: const Text('Total Zonal Coordinators'),
                  trailing: Text('${breakDownSummaries.data?.totalCoordinators}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: color.AppColor.homePageTheme,),
                  title: const Text('Total Property Owners'),
                  trailing: Text('${breakDownSummaries.data?.totalPropertyOwners}'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: color.AppColor.homePageTheme,),
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
