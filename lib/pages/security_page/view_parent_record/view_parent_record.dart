import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/models/parent_report_data_model/parent_report_data_model.dart';
import 'package:magodo/pages/security_page/view_parent_record/view_parent_record_Card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/resident_data_model/residentdata.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/title.dart';

class ViewParentRecord extends StatefulWidget {
  ResidentModel? data;

  ViewParentRecord({Key? key, this.data}) : super(key: key);

  @override
  State<ViewParentRecord> createState() => _ViewParentRecordState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewParentRecordState extends State<ViewParentRecord> {
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
  List<ParentReport> viewMembers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getViewResidentReport({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var data = await Services().viewParentReport(
      currentPage,
      _searchWords.text,
    );

    final result = parentReportsFromJson(data);

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
        var data = await Services().viewParentReport(
          currentPage,
          _searchWords.text,
        );

        final result = parentReportsFromJson(data);
        if (result.data.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No record found'),
            ),
          );
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
          child: Column(
            children: [
              TitleContainer(
                title: 'Dashboard',
                data: widget.data,
              ),
              Container(
                color: color.AppColor.residentBody,
                padding:  EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                child: Column(children: [
                  Row(
                    children:  [
                      Text(
                        "View Parent Record",
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
                  _buildSearchBar(),
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
                    style:  TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getViewResidentReport(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getViewResidentReport();
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: viewMembers.isEmpty
                      ? const Center(
                          child: Text('No record found'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            final member = viewMembers[index];

                            return SingleChildScrollView(
                              child: ViewParentRecordCard(
                                data: member,
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
