import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/models/view_memberModel/view_memberModel.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/view_member/view_memberCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../components/app_page_theme_action_button.dart';
import '../../../../components/components_for_class_of_varable/userGroup.dart';
import '../../../../components/date_text_field.dart';
import '../../../../components/roundedDropDownTextfield.dart';
import '../../../../components/text_for_form.dart';
import '../../../../components/textfields_types/Category_for_filter.dart';
import '../../../../components/textfields_types/category_drop_down_list.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewMember extends StatefulWidget {
  ResidentModel? data;

  ViewMember({Key? key, this.data}) : super(key: key);

  @override
  State<ViewMember> createState() => _ViewMemberState();
}

TextEditingController _searchWords = TextEditingController();
TextEditingController _startDate = TextEditingController();
TextEditingController _startEnd = TextEditingController();

class _ViewMemberState extends State<ViewMember> {
  Timer? debouncer;
  String? category;

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
    String zone = widget.data?.zone ?? '';
    if (widget.data?.usr_group == UserGroup.SUPER_ADMIN ||
        widget.data?.usr_group == UserGroup.ADMIN) {
      zone = '';
    }

    var data = await Services().viewMembersReportForSAdmin(
        page: currentPage,
        userGroup: widget.data?.usr_group ?? '',
        zone: zone,
        search: _searchWords.text);

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

  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Approved',
    'Declined',
  ];

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: Text(
        statusOptions[0],
        style: TextStyle(fontSize: 15.sp),
      ),
      value: status,
      onChanged: (value) => setState(() {
        if (value == '-- Select Status ') {
          value = null;
        }
        status = value as String;
      }),
      items: statusOptions.map(buildStatusItem).toList(),
    );
  }

  DropdownMenuItem<String> buildStatusItem(String statusOptions) =>
      DropdownMenuItem(
        value: statusOptions,
        child: Text(
          statusOptions,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      );

  Future _filterFunction() async => debounce(() async {
        int currentPage = 0;
        String zone = widget.data?.zone ?? '';
        if (widget.data?.usr_group == UserGroup.SUPER_ADMIN ||
            widget.data?.usr_group == UserGroup.ADMIN) {
          zone = '';
        }
        var data = await Services().viewMembersReportForSAdmin(
            page: currentPage,
            userGroup: widget.data?.usr_group ?? '',
            zone: zone,
            search: _searchWords.text,
            startDate: _startDate.text,
            endDate: _startEnd.text,
            status: status,
            residentCategory: category);

        final result = viewMembersFromJson(data);
        if (result.data.isEmpty) {
          print('empty');
        }
        setState(() {
          viewMembers = result.data;
        });
        _startEnd.clear();
        _startDate.clear();
      });

  createAlertDialog() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Center(child: Text('Filter Record')),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const TextForForm(text: "Start Date"),
              CustomDatePicker(date: _startDate),
              const TextForForm(text: "End Date"),
              CustomDatePicker(date: _startEnd),
              const TextForForm(text: "Status"),
              _buildStatus(),
              BuildCategoryForFilter(
                residentType: category,
                onChanged: (value) => setState(() {
                  category = value as String;
                }),
              ),
              SizedBox(
                height: 20.h,
              ),
              ActionPageButton(
                  onPressed: () async {
                    _filterFunction();
                    Navigator.of(context).pop();
                  },
                  text: 'Filter'),
            ],
          ),
        ),
      ),
    );
  }

  Future _searchFunction() async => debounce(() async {
        int currentPage = 0;
        String zone = widget.data?.zone ?? '';
        if (widget.data?.usr_group == UserGroup.SUPER_ADMIN ||
            widget.data?.usr_group == UserGroup.ADMIN) {
          zone = '';
        }
        var data = await Services().viewMembersReportForSAdmin(
            page: currentPage,
            userGroup: widget.data?.usr_group ?? '',
            zone: zone,
            search: _searchWords.text.toString());

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
                Row(
                  children: [
                    Text(
                      'View Member Report',
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
                Row(children: [
                  Container(
                    width: 120.w,
                    height: 50.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey, backgroundColor: color.AppColor.landingPage2,
                      ),
                      onPressed: () {
                        createAlertDialog();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_list_sharp,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Filter',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
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
                              userGroup: widget.data?.usr_group ?? '',
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
