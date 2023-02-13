import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/update_registration_vehicle.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/superAdmin_vehicleRegistration/superA_vehicleRegistrationCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../api/api.dart';
import '../../../../components/action_page_button2.dart';
import '../../../../components/app_page_theme_action_button.dart';
import '../../../../components/date_text_field.dart';
import '../../../../components/roundedDropDownTextfield.dart';
import '../../../../components/roundedTextSearchField.dart';
import '../../../../components/text_for_form.dart';
import '../../../../components/textfields_types/name_textfield.dart';
import '../../../../components/title.dart';
import '../../../resident_Page/forms_component/delete_edit_button.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../models/resident_data_model/residentdata.dart';
import '../../../../models/vehicle_dataModel/superAdminVehicleData.dart';

class SuperAdminVehicleReport extends StatefulWidget {
  ResidentModel? data;

  SuperAdminVehicleReport({Key? key, this.data}) : super(key: key);

  @override
  State<SuperAdminVehicleReport> createState() =>
      _SuperAdminVehicleReportState();
}

TextEditingController _searchWords = TextEditingController();
TextEditingController startDate = TextEditingController();
TextEditingController startEnd = TextEditingController();
TextEditingController rfidMin = TextEditingController();
TextEditingController rfidMax = TextEditingController();

class _SuperAdminVehicleReportState extends State<SuperAdminVehicleReport> {
  var totalRfid;
  var zone;
  String? status;
  final statusOptions = [
    '-- Select Status ',
    'Approved',
    'Declined',
  ];
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    getTotalRfid();
  }

  void getTotalRfid() async{

    var url = 'totalIssuedRFID';

    var res = await CallApi().getData(url);
    var r = jsonDecode(res.body);
    print(r);
    setState(() {
      totalRfid = r['data']['total'];
    });
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
  List<FetchSuperAdminVehicle> vehicles = [];
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


    var data = await Services().superAdminVehicleReport(
        startDate: '',
        startEnd: '',
        page: currentPage,
        search: '',
        status: '',
        rfidMin: '',
        rfidMax: "",
        zone: "");
    final result = fetchSuperAdminVehiclesFromJson(data);

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
functionRefresh()async{
  getVehicle(isRefresh: true);
}
  popMessage({fileName, filePath, residentCode, row_id}) {
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
                    primary: color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                  deleteVehicle(residentCode, row_id);
                },
                child: const Text("Yes")),
            SizedBox(
              width: 30.w,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: color.AppColor.homePageTheme,
                    onPrimary: color.AppColor.landingPage2,
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

  Widget _buildStatus() {
    return RoundedDropDownTextField(
      hint: Text(
        statusOptions[0],
        style: TextStyle(fontSize: 15.sp),
      ),
      value: status,
      onChanged: (value) => setState(() {
        if(value =='-- Select Status '){
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
              CustomDatePicker(date: startDate),
              const TextForForm(text: "End Date"),
              CustomDatePicker(date: startEnd),
              const TextForForm(text: "Status"),
              _buildStatus(),
              NameTextField(
                  controller: rfidMax, hint: "rfid max", nameType: "Rfid Max"),
              NameTextField(
                  controller: rfidMin, hint: "Rfid min", nameType: "Rfid min"),
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


  deleteVehicle(residentCode, row_id) async {
    var data = await Services().deleteVehicle(residentCode, row_id);
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

  Future _filterFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().superAdminVehicleReport(
            startDate: startDate.text.isEmpty ? '' : startDate.text,
            startEnd: startEnd.text.isEmpty ? '' : startEnd.text,
            page: page,
            search: '',
            status: status ?? '',
            rfidMin: rfidMin.text.isEmpty ? '' : rfidMin.text,
            rfidMax: rfidMax.text.isEmpty ? "" : rfidMax.text,
            zone: zone ?? "");

        final result = fetchSuperAdminVehiclesFromJson(data);
        if (result.data.isEmpty) {}
        setState(() {
          vehicles = result.data;
        });
        startEnd.clear();
        startDate.clear();
        rfidMax.clear();
        rfidMin.clear();
      });

  Future _searchFunction() async => debounce(() async {
        int page = 0;
        var data = await Services().superAdminVehicleReport(
            startDate: '',
            startEnd: '',
            page: page,
            search: _searchWords.text.toString(),
            status: '',
            rfidMin: '',
            rfidMax: "",
            zone: "");

        final result = fetchSuperAdminVehiclesFromJson(data);
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
              padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    ListTile(
                      leading:  ActionPageButton2(
                        height: 50.h,
                        onPressed: () {
                          createAlertDialog();
                        },
                        text: 'Filter',
                        primaryColor: Colors.white70,
                      ),
                      // trailing: Row(
                      //   children: [
                      //     SizedBox(width: 160.w,),
                      //     const Text("Total RFID Issued: "),
                      //
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: color.AppColor.verifiedColor,
                      //           border: Border.all(color: Colors.white),
                      //           borderRadius: BorderRadius.circular(6.0)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text("$totalRfid", style: TextStyle(color:color.AppColor.homePageBackground),),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'View Vehicle Report',
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
                  "1-${vehicles.length} of $totalPages results",
                  style: TextStyle(fontSize: 16.sp),
                ),
                trailing: Text(
                  "Results per page ${vehicles.length}",
                  style: TextStyle(fontSize: 16.sp),
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
                                SuperAdminVehicleReportCard(vehicle: vehicle, data: widget.data, function: (){
                                  functionRefresh();
                                },),
                                DeleteUpdateButton(
                                  onPressedDeleteButton: () async {
                                    await popMessage(
                                        fileName: vehicle.docName,
                                        filePath: vehicle.doc,
                                        residentCode: vehicle.residentCode,
                                        row_id: vehicle.guid);
                                  },
                                  onPressedUpdateButton: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateVehicleRegistration(
                                                  vehicleData: vehicle,
                                                  data: widget.data,
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
