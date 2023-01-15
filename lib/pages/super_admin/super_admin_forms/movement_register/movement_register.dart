import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';
import 'package:magodo/models/movement_register_reportModel/movement_register_reportModel.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/movement_register/movement_registerCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../models/resident_data_model/residentdata.dart';

class MovementRegister extends StatefulWidget {
  ResidentModel? data;

  MovementRegister({Key? key, this.data}) : super(key: key);

  @override
  State<MovementRegister> createState() => _MovementRegisterState();
}

TextEditingController _searchWords = TextEditingController();

class _MovementRegisterState extends State<MovementRegister> {
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
  List<MovementRegisterReport> viewMembers = [];

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
    var data;
   if(widget.data?.usr_group== UserGroup.SUPER_ADMIN) {
      data = await Services().viewMovementRegister(
        currentPage,
        _searchWords.text,
      );
    }else{
     data = await Services().adminMovementRegisterReport(
        currentPage,
        _searchWords.text,
        widget.data?.zone,
      );
   }

    final result = movementRegisterReportsFromJson(data);

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
        if(widget.data?.usr_group== UserGroup.SUPER_ADMIN) {
          data = await Services().viewMovementRegister(
            currentPage,
            _searchWords.text,
          );
        }else{
          data = await Services().adminMovementRegisterReport(
            currentPage,
            _searchWords.text,
            widget.data?.zone,
          );
        }


        final result = movementRegisterReportsFromJson(data);
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
                  children: [
                    Text(
                      "movement Register",
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                  style:  TextStyle(fontSize: 16.sp),
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
                              child: MovementRegisterCard(
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
