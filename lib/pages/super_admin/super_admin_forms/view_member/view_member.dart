import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/models/view_memberModel/view_memberModel.dart';
import 'package:magodo/models/view_passcode_data_model/visitordata.dart';
import 'package:magodo/pages/resident_Page/visitor_passcode_card/visitor_report_card.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/view_member/view_memberCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewMember extends StatefulWidget {
  ResidentModel? data;

  ViewMember({Key? key, data}) : super(key: key);

  @override
  State<ViewMember> createState() => _ViewMemberState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewMemberState extends State<ViewMember> {
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
  List<ViewMemberModel> viewMembers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getViewMember({bool isRefresh = false}) async {
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

    final result = viewMembersFromJson(data);

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
        int page = 0;
        var data = await Services().viewSentPasscodeReport(
          page,
          widget.data?.resident_code,
          _searchWords.text.toString(),
        );

        final result = viewMembersFromJson(data);
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
                      'View Member Report',
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
                  final result = await getViewMember(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getViewMember();
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
                            child: ViewMemberCard(
                              data: member,
                            ),
                          );
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
