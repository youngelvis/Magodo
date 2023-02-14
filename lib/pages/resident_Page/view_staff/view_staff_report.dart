import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/add_staff_data_model/staffdata.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/forms_component/delete_edit_button.dart';
import 'package:magodo/pages/resident_Page/view_staff/view_staff_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../form_pages_for_residents/update_staff/updateStaff.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewStaffMembers extends StatefulWidget {
  ResidentModel? data;

  ViewStaffMembers({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewStaffMembers> createState() => _ViewStaffMembersState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewStaffMembersState extends State<ViewStaffMembers> {
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  int currentPage = 0;
  late int totalPages = 0;
  List<Staff> staffs = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getStaff({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    var data = await Services().getAddStaffReport(
      widget.data?.resident_code,
      currentPage,
      '',
      _searchWords.text,
    );
    final result = staffsFromJson(data);

    if (isRefresh) {
      staffs = result.data;
    } else {
      staffs.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().getAddStaffReport(
          page,
          widget.data?.resident_code,
          '',
          _searchWords.text.toString(),
        );

        final result = staffsFromJson(data);
        if (result.data.isEmpty) {}
        setState(() {
          staffs = result.data;
        });
      });

  popMessage(info) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure you want to delete this staff?'),
        actions: [
          Row(children: [
            SizedBox(
              width: 50.w,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                  deleteStaff(info);
                },
                child: const Text("Yes")),
            SizedBox(
              width: 30.w,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ])
        ],
      ),
    );
  }

  deleteStaff(info) async {
    var data = await Services().getDeleteStaff(info);

    var message = data['message'];

    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                getStaff(isRefresh: true);
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: RoundedTextSearchField(
            icon: const Icon(Icons.search),
            onChanged: (value) async {
              await _searchFunction();
            },
            hintText: 'Search',
            controller: _searchWords,
          ),
        ),
      ],
    );
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
          child: Column(children: [
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
                      'View Staff Report',
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
                _buildSearchBar(),
                SizedBox(
                  height: 20.h,
                ),

              ]),
            ),
            const Divider(
              thickness: 2,
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: ListTile(
                leading: Text(
                  "${staffs.length} of $totalPages results",
                  style: TextStyle(fontSize: 16.sp),
                ),
                trailing: Text(
                  "Results per page ${staffs.length}",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getStaff(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getStaff();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: staffs.isEmpty
                    ? Center(child: const Text('nothing yet'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          final staff = staffs[index];
                          return SingleChildScrollView(
                              child: Card(
                            child: Column(
                              children: [
                                ViewStaffCard(
                                  staffName: staff.dependantName ?? '',
                                  staffCode: staff.staffPasscode ?? '',
                                  employmentDate: staff.empdateOrDob ?? '',
                                  staffMobile: staff.dependantPhone ?? '',
                                  contactDetails: staff.dependantContacts ?? '',
                                  employementType: staff.relationship ?? '',
                                  date: staff.dateCreated ?? '',
                                  validityEnds: staff.validityEnds ?? '',
                                ),
                                DeleteUpdateButton(
                                  onPressedDeleteButton: () async {
                                    await popMessage(staff.guid);
                                  },
                                  onPressedUpdateButton: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateStaff(
                                                  data: widget.data,
                                                  staff: staff,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ));
                        },
                        itemCount: staffs.length,
                      ),
              ),
            )
          ]),
        )));
  }
}
