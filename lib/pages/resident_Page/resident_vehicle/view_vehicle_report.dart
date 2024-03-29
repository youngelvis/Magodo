import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/models/vehicle_dataModel/vehicledata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/update_reg_vehicle_resident.dart';
import 'package:magodo/pages/resident_Page/forms_component/delete_edit_button.dart';
import 'package:magodo/pages/resident_Page/resident_vehicle/resident_vechicle_card.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ViewVehicleReport extends StatefulWidget {
  ResidentModel? data;

  ViewVehicleReport({Key? key, required this.data}) : super(key: key);

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
      widget.data?.resident_code,
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

  deleteVehicle({
    residentCode,
    row_id,
  }) async {
    var data = await Services().deleteVehicle(residentCode, row_id);
    var message = data['message'];

    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: color.AppColor.landingPage2, backgroundColor: color.AppColor.homePageTheme,
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
  popMessage({residentCode, row_id}) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure you want to delete this vehicle?'),
        actions: [
          Row(children: [
            SizedBox(
              width: 50.w,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: color.AppColor.landingPage2, backgroundColor: color.AppColor.homePageTheme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                  deleteVehicle(residentCode:residentCode, row_id:row_id);
                },
                child: const Text("Yes")),
            SizedBox(
              width: 30.w,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: color.AppColor.landingPage2, backgroundColor: color.AppColor.homePageTheme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ])
        ],
      ),
    );
  }



  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().getMemberVehicleReport(
          page,
          widget.data?.resident_code,
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
              padding:  EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
              child: Column(children: [
                Row(
                  children:  [
                    Text(
                      'View Vehicle Report',
                      style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
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
                  "1-${vehicles.length} of $totalPages results",
                  style: TextStyle(fontSize: 16.sp),
                ),
                trailing: Text(
                  "Results per page ${vehicles.length}",
                  style:  TextStyle(fontSize: 16.sp),
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
                    ? const Center(child: Text('No Record Yet'))
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
                                  docName: vehicle.docName??'',
                                  regNo: vehicle.registrationNo,
                                ),
                                DeleteUpdateButton(onPressedDeleteButton:  () async{
                                  await popMessage(residentCode: widget.data?.resident_code, row_id: vehicle.guid);
                                }, onPressedUpdateButton:  () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateVehicleRegistration2(
                                            data: widget.data,
                                            vehicleData: vehicle,
                                          )));
                                },
                                ),
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
