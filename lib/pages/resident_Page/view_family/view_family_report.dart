import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/add_family_data_model/familydata.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/update_family/update_family.dart';
import 'package:magodo/pages/resident_Page/forms_component/delete_edit_button.dart';
import 'package:magodo/pages/resident_Page/view_family/view_family_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewFamilyMembers extends StatefulWidget {
ResidentModel? data;

   ViewFamilyMembers({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewFamilyMembers> createState() => _ViewFamilyMembersState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewFamilyMembersState extends State<ViewFamilyMembers> {
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
  List<Family> families = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getFamily({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    var data = await Services().getAddFamilyReport(
      widget.data?.resident_code,
      currentPage,
      '',
      _searchWords.text,
    );

    final result = familiesFromJson(data);

    if (isRefresh) {
      families = result.data;
    } else {
      families.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().getAddFamilyReport(
          page,
          widget.data?.resident_code,
          '',
          _searchWords.text.toString(),
        );

        final result = familiesFromJson(data);
        if (result.data.isEmpty) {}
        setState(() {
          families = result.data;
        });
      });

  deleteFamilyMember(info) async {
    var data = await Services().getDeleteFamilyMember(info);

    var message = data['message'];

    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color.AppColor.homePageTheme,
                  onPrimary: color.AppColor.landingPage2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {
                getFamily(isRefresh: true);
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

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
                padding:  EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                child: Column(children: [
                  _buildSearchBar(),
                   SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children:  [
                      Text(
                        'View Family Report',
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
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
                    "1-${families.length} of $totalPages results",
                    style:  TextStyle(fontSize: 16.sp),
                  ),
                  trailing: Text(
                    "Results per page ${families.length}",
                    style:  TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getFamily(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getFamily();
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: families.isEmpty
                      ? const Text('nothing yet')
                      : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            final family = families[index];

                            return Card(
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    child: ViewFamilyCard(
                                      fullName: family.fullName ?? '',
                                      date: family.lastLoginDate,
                                      email: family.email ?? '',
                                      dependentCode: family.residentCode ?? '',
                                      status: family.status ?? '',
                                      dependantPhone: family.dependantPhone ?? '',
                                    ),
                                  ),
                                  DeleteUpdateButton(
                                    onPressedDeleteButton: () async {
                                      await deleteFamilyMember(
                                          family.residentCode);
                                    },
                                    onPressedUpdateButton: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateFamily(
                                                      data: widget.data,
                                                  response: family,)));
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: families.length,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
