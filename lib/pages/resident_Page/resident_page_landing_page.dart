import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/models/view_passcode_data_model/visitordata.dart';
import 'package:magodo/pages/resident_Page/visitor_passcode_card/visitor_report_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ResidentPageLandingPage extends StatefulWidget {
  ResidentModel? data;

   ResidentPageLandingPage({Key? key, this.data})
      : super(key: key);

  @override
  State<ResidentPageLandingPage> createState() =>
      _ResidentPageLandingPageState();
}

TextEditingController _searchWords = TextEditingController();

class _ResidentPageLandingPageState extends State<ResidentPageLandingPage> {
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
  List<Visitor> visitors = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getVisitors({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var data = await Services().viewSentPasscodeReport(
      currentPage,
      widget.data?.resident_code,
      _searchWords.text,
    );

    final result = visitorsFromJson(data);

    if (isRefresh) {
      visitors = result.data;
    } else {
      visitors.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().viewSentPasscodeReport(
          page,
          widget.data?.resident_code,
          _searchWords.text.toString(),
        );

        final result = visitorsFromJson(data);
        if (result.data.isEmpty) {
          print('empty');
        }
        setState(() {
          visitors = result.data;
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
          child: Column(children: [
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
                      'View Visitors Report',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                  "1-${visitors.length} of $totalPages results",
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  "Results per page ${visitors.length}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getVisitors(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getVisitors();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: visitors.isEmpty
                    ? const Text('nothing yet')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          final visitor = visitors[index];

                          return SingleChildScrollView(
                            child: VisitorPasscodeReport(
                              visitorsName: visitor.visitorName ?? '',
                              residentName: visitor.residentName ?? '',
                              address: visitor.residentAddress ?? '',
                              residentMobile: visitor.residentMsisdn ?? '',
                              visitorMobile: visitor.visitorMsisdn ?? '',
                              visitorCode: visitor.visitor_code ?? '',
                              date: visitor.createdDate ?? '',
                            ),
                          );
                        },
                        itemCount: visitors.length,
                      ),
              ),
            )
          ]),
        )));
  }
}
