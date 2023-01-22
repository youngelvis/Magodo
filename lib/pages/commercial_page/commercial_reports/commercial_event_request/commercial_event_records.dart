import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/commercial_event_request/commercial_event_requests.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/commercial_page/commercial_reports/commercial_event_request/commercial_event_request_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../services/services.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../components/roundedTextSearchField.dart';
import '../../../../components/title.dart';

class CommercialEventReport extends StatefulWidget {
  ResidentModel? data;

  CommercialEventReport({Key? key, this.data}) : super(key: key);

  @override
  State<CommercialEventReport> createState() => _CommercialEventReportState();
}

TextEditingController _searchWords = TextEditingController();

class _CommercialEventReportState extends State<CommercialEventReport> {
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
  List<CommercialEventRequest> viewMembers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> viewCommercialEventReport({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var data = await Services().commercialEventReport(
        currentPage,widget.data?.resident_code, _searchWords.text);

    final result = commercialEventRequestsFromJson(data);

    if (isRefresh) {
      viewMembers = result.data;
    } else {
      viewMembers.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  Future _searchFunction() async => debounce(() async {
        int currentPage = 0;
        var data = await Services().parentReport(
            currentPage, _searchWords.text, widget.data?.resident_code);

        final result = commercialEventRequestsFromJson(data);
        if (result.data.isEmpty) {
          print('empty');
        }
        setState(() {
          viewMembers = result.data;
        });
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
          padding: EdgeInsets.only(
            top: 20.h,
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
                _buildSearchBar(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Commercial Event Report",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
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
            Container(
              color: Colors.white,
              height: 50,
              child: ListTile(
                leading: Text(
                  "1-${viewMembers.length} of $totalPages results",
                  style: TextStyle(fontSize: 16.sp),
                ),
                trailing: Text(
                  "Results per page ${viewMembers.length}",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result =
                      await viewCommercialEventReport(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await viewCommercialEventReport();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: viewMembers.isEmpty
                    ? const Text('nothing yet')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          final member = viewMembers[index];

                          return SingleChildScrollView(
                              child: CommercialEventRequestCard(
                            data: member,
                          ));
                        },
                        itemCount: viewMembers.length,
                      ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
