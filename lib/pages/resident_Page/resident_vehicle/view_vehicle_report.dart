import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magodo/models/vehicledata.dart';
import 'package:magodo/pages/resident_Page/forms_component/delete_edit_button.dart';
import 'package:magodo/pages/resident_Page/resident_vehicle/resident_vechicle_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewVehicleReport extends StatefulWidget {
  final data;

  const ViewVehicleReport({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewVehicleReport> createState() => _ViewVehicleReportState();
}

TextEditingController _searchWords = TextEditingController();

class _ViewVehicleReportState extends State<ViewVehicleReport> {
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
  List<Vehicle> vehicles = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getVehicle({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    var data = await Services().getMemberVehicleReport(
      widget.data['resident_code'],
      currentPage,
      '',
      _searchWords.text,
    );
    final result = vehiclesFromJson(data);

    if (isRefresh) {
      vehicles = result.data;
    } else {
      vehicles.addAll(result.data);
    }
    setState(() {});
    currentPage = currentPage + 10;
    totalPages = result.recordsTotal;
    return true;
  }

  deleteStaff(info) async {
    var data = await Services().getDeleteStaff(info);

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
                getVehicle(isRefresh: true);
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().getMemberVehicleReport(
          page,
          widget.data['resident_code'],
          '',
          _searchWords.text.toString(),
        );

        final result = vehiclesFromJson(data);
        if (result.data.isEmpty) {}
        setState(() {
          vehicles = result.data;
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
                      'View Vehicle Report',
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
                  "1-${vehicles.length} of $totalPages results",
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  "Results per page ${vehicles.length}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getVehicle(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getVehicle();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: vehicles.isEmpty
                    ? const Text('nothing yet')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          final vehicle = vehicles[index];
                          return SingleChildScrollView(
                              child: Card(
                            child: Column(
                              children: [
                                VehicleReportCard(
                                  mraReceiptNo: vehicle.receiptNo ?? '',
                                  carMake: vehicle.make ?? '',
                                  amountPaid: vehicle.amount ?? '',
                                  vehicleCode: vehicle.vehicleNo ?? '',
                                  vehicleModel: vehicle.model ?? '',
                                  vehicleColour: vehicle.color ?? '',
                                  declineMessage: vehicle.declineMessage ?? '',
                                  uploadedFile: vehicle.doc ?? '',
                                  govAgency: vehicle.govAgency ?? '',
                                  date: vehicle.tstamp ?? '',
                                ),
                                // DeleteUpdateButton(onPressedDeleteButton:  () async{
                                //   await deleteStaff(vehicle.guid);
                                // },
                                // ),
                              ],
                            ),
                          ));
                        },
                        itemCount: vehicles.length,
                      ),
              ),
            )
          ]),
        )));
  }
}
