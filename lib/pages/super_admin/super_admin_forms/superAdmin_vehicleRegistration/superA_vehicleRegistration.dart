import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/register_vechicle/update_registration_vehicle.dart';
import 'package:magodo/pages/super_admin/super_admin_forms/superAdmin_vehicleRegistration/superA_vehicleRegistrationCard.dart';
import 'package:magodo/services/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../components/roundedTextSearchField.dart';
import '../../../../components/title.dart';
import '../../../resident_Page/forms_component/delete_edit_button.dart';
import '/../components/components_for_class_of_varable/colors.dart' as color;
import '../../../../models/resident_data_model/residentdata.dart';
import '../../../../models/vehicle_dataModel/superAdminVehicleData.dart';

class SuperAdminVehicleRegistration extends StatefulWidget {
  ResidentModel? data;

  SuperAdminVehicleRegistration({Key? key, this.data}) : super(key: key);

  @override
  State<SuperAdminVehicleRegistration> createState() =>
      _SuperAdminVehicleRegistrationState();
}

TextEditingController _searchWords = TextEditingController();
TextEditingController startDate = TextEditingController();
TextEditingController startEnd = TextEditingController();
TextEditingController rfidMin = TextEditingController();
TextEditingController rfidMax = TextEditingController();

class _SuperAdminVehicleRegistrationState
    extends State<SuperAdminVehicleRegistration> {
  var zone;
  var status;
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

  deleteVehicle({fileName, filePath, residentCode, row_id}) async {
    const String _url = "http://132.145.231.191/portal/mraLagosApp/api/";
    const String _apiUrl = 'deleteVehicle';

    FormData formData = FormData.fromMap({
      'resident_code': residentCode,
      "row_id": row_id,
      "file": await MultipartFile.fromFile(filePath, filename: fileName)
    });

    var dio = Dio();
    var username = 'test';
    var password = 'benard@1991';
    var fullUrl = _url + _apiUrl;
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    dio.options.headers["Content-Type"] = 'multipart/form-data';
    dio.options.headers["authorization"] = basicAuth;

    final response = await dio.post(
      fullUrl,
      data: formData,
    );

    final responseBody = response.data;

    return responseBody;
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
              child: Column(children: [
                _buildSearchBar(),
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
                                SuperAdminVehicleReportCard(data: vehicle),
                                DeleteUpdateButton(
                                  onPressedDeleteButton: () async {
                                    await deleteVehicle(
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
