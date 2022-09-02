import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magodo/components/filter_and_sort_buttons.dart';
import 'package:magodo/models/visitordata.dart';
import 'package:magodo/pages/resident_Page/visitor_passcode_card/visitor_report_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ResidentPageLandingPage extends StatefulWidget {
  final data;

  const ResidentPageLandingPage({Key? key, required this.data})
      : super(key: key);

  @override
  State<ResidentPageLandingPage> createState() =>
      _ResidentPageLandingPageState();
}

TextEditingController _searchWords = TextEditingController();

class _ResidentPageLandingPageState extends State<ResidentPageLandingPage> {
  int currentPage = 0;
  late int totalPages;
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
        currentPage, "5", widget.data['resident_code'], widget.data['zone']);

    final result = visitorsFromJson(data);
    if (isRefresh) {
      visitors = result.data;
    } else {
      visitors.addAll(result.data);
    }
    currentPage = currentPage + 5;
    totalPages = result.recordsTotal;
    print(data);
    setState(() {});
    return true;
  }

  Widget _buildSearchBar() {
    return RoundedTextSearchField(
      hintText: 'Search',
      controller: _searchWords,
      icon: const Icon(Icons.search),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            body: Container(
          color: color.AppColor.homePageBackground,
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(children: [
            const TitleContainer(title: 'Dashboard'),
            Container(
              color: color.AppColor.residentBody,
              padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
              child: Column(children: [
                _buildSearchBar(),
                const SizedBox(
                  height: 20,
                ),
                const FilterAndSortButtons(),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
            const Divider(
              thickness: 2,
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    final visitor = visitors[index];

                    return SingleChildScrollView(
                        child: VisitorPasscodeReport(
                            visitorsName: visitor.visitorName,
                            residentName: visitor.residentName,
                            address: visitor.residentAddress,
                            residentMobile: visitor.residentMsisdn,
                            visitorMobile: visitor.visitorMsisdn,
                            visitorCode: visitor.visitor_code));
                  },
                  itemCount: visitors.length,
                ),
              ),
            )
          ]),
        )));
  }
}
