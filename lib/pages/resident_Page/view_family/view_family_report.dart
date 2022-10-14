import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magodo/models/familydata.dart';
import 'package:magodo/pages/resident_Page/view_family/view_family_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewFamilyMembers extends StatefulWidget {
  final data;

  const ViewFamilyMembers({Key? key, required this.data}) : super(key: key);

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
      widget.data['resident_code'],
      currentPage,
      '',
      _searchWords.text,
    );

    print(data);
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
        print(_searchWords.text);
        var data = await Services().getAddFamilyReport(
          page,
          widget.data['resident_code'],
          '',
          _searchWords.text.toString(),
        );

        final result = familiesFromJson(data);
        if (result.data.isEmpty) {
          print('empty');
        }
        setState(() {
          families = result.data;
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
                  "1-${families.length} of $totalPages results",
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  "Results per page ${families.length}",
                  style: const TextStyle(fontSize: 16),
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

                          return SingleChildScrollView(
                            child: ViewFamilyCard(
                              fullName: family.fullName ?? '',
                              date: family.lastLoginDate ,
                              email: family.email ?? '',
                              dependentCode: family.residentCode ?? '',
                              status: family.status ?? '',
                            ),
                          );
                        },
                        itemCount: families.length,
                      ),
              ),
            )
          ]),
        )));
  }
}
