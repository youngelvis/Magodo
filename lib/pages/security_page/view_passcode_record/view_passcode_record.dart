import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/security_page/view_passcode_record/view_passcode_record_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../components/roundedTextSearchField.dart';
import '../../../components/title.dart';
import '../../../models/passcode_report_data_model/passcode_report_data_model.dart';
import '../../../services/services.dart';

class ViewPasscodeRecord extends StatefulWidget {
  ResidentModel? data;

  ViewPasscodeRecord({Key? key, this.data}) : super(key: key);

  @override
  State<ViewPasscodeRecord> createState() => _ViewPasscodeRecordState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewPasscodeRecordState extends State<ViewPasscodeRecord> {
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
  List<PasscodeReport> viewMembers = [];

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
    var data;
    var zone = widget.data?.zone;
    if (widget.data?.usr_group == UserGroup.SECURITY) {
      data = await Services().passcodeHistory(
        currentPage,
        _searchWords.text,
      );
    } else if (widget.data?.usr_group == UserGroup.SUPER_ADMIN) {
      data = await Services()
          .superAdminPasscodeHistory(currentPage, _searchWords.text, zone);
    } else {
      data = await Services()
          .adminPasscodeHistory(currentPage, _searchWords.text, zone);
    }

    final result = passcodeReportsFromJson(data);

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
        var data;
        var zone = widget.data?.zone;
        if (widget.data?.usr_group == UserGroup.SECURITY) {
          data = await Services().passcodeHistory(
            currentPage,
            _searchWords.text,
          );
        } else if (widget.data?.usr_group == UserGroup.SUPER_ADMIN) {
          data = await Services()
              .superAdminPasscodeHistory(currentPage, _searchWords.text, zone);
        } else {
          data = await Services()
              .adminPasscodeHistory(currentPage, _searchWords.text, zone);
        }

        final result = passcodeReportsFromJson(data);
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
                        "View Passcode Record",
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
                              child: ViewPasscodeRecordCard(
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
