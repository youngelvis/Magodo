import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/event_requestModel/event_requestModel.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/event_request/event_request_reportCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;

class EventRequestReport extends StatefulWidget {
  ResidentModel? data;

  EventRequestReport({Key? key, required this.data}) : super(key: key);

  @override
  State<EventRequestReport> createState() => _EventRequestReportState();
}

TextEditingController _searchWords = TextEditingController();

class _EventRequestReportState extends State<EventRequestReport> {
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
  List<EventReport> memberStaff = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> viewEventReports({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var data =
        await Services().viewEventRequest(currentPage, _searchWords.text);
    final result = eventReportsFromJson(data);

    if (isRefresh) {
      memberStaff = result.data;
    } else {
      memberStaff.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  Future _searchFunction() async => debounce(() async {
        int currentPage = 0;
        var data =
            await Services().viewEventRequest(currentPage, _searchWords.text);

        final result = eventReportsFromJson(data);
        if (result.data.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No record found'),
            ),
          );
        } else {
          memberStaff = result.data;
          setState(() {});
        }
      });

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
          padding:  EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(children: [
            TitleContainer(
              title: 'Dashboard',
              data: widget.data,
            ),
            Container(
              color: color.AppColor.residentBody,
              padding:  EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
              child: Column(children: [
                _buildSearchBar(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children:  [
                    Text(
                      "View Event Request",
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
            Container(
              color: Colors.white,
              height: 50,
              child: ListTile(
                leading: Text(
                  "1-${memberStaff.length} of $totalPages results",
                  style:  TextStyle(fontSize: 16.sp),
                ),
                trailing: Text(
                  "Results per page ${memberStaff.length}",
                  style:  TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await viewEventReports(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await viewEventReports();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: memberStaff.isEmpty
                    ? const Center(
                        child: Text('No record found'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          final member = memberStaff[index];

                          return SingleChildScrollView(
                              child: EventRequestReportCard(
                            data: member,
                          ));
                        },
                        itemCount: memberStaff.length,
                      ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
