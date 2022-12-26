import 'dart:async';
import 'package:magodo/components/title.dart';

import '/../components/components_for_class_of_varable/colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/models/activity_log_reportModel/activity_log_reportModel.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'activity_log_reportCard.dart';

class ViewActivityReport extends StatefulWidget {
  ResidentModel? data;

  ViewActivityReport({Key? key, this.data}) : super(key: key);

  @override
  State<ViewActivityReport> createState() => _ViewActivityReportState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewActivityReportState extends State<ViewActivityReport> {
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
  List<ActivityLogReport> viewMembers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getViewMemberReport({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var data = await Services().viewActivityLogReport(
      currentPage,
      _searchWords.text,
    );

    final result = activityLogReportsFromJson(data);

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
        var data = await Services().viewActivityLogReport(
          currentPage,
          _searchWords.text,
        );

        final result = activityLogReportsFromJson(data);
        ;
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
                  _buildSearchBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Activity Log report",
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
              Container(
                color: Colors.white,
                height: 50,
                child: ListTile(
                  leading: Text(
                    "1-${viewMembers.length} of $totalPages results",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    "Results per page ${viewMembers.length}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getViewMemberReport(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getViewMemberReport();
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
                              child: ActivityLogReportCard(
                                action: member.action ?? "",
                                actionDescription:
                                    member.actionDescription ?? "",
                                actionUser: member.actionUser ?? "",
                                otherDetails: member.otherDetails ?? "",
                                fullName: member.fullName,
                                residentCode: member.residentCode ?? "",
                                createdDate: member.createdDate ?? "",
                              ),
                            );
                          },
                          itemCount: viewMembers.length,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
