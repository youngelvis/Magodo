// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/pages/settings_page/web_view.dart';
import 'package:magodo/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/app_page_theme_action_button.dart';
import '../../../../components/text_for_form.dart';
import '../../../../components/textfields_types/name_textfield.dart';
import '../../../../models/resident_data_model/residentdata.dart';
import '../../../../models/vehicle_dataModel/superAdminVehicleData.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;

class SuperAdminVehicleReportCard extends StatefulWidget {
  Function function;
  ResidentModel? data;
  FetchSuperAdminVehicle vehicle;

  SuperAdminVehicleReportCard(
      {Key? key, required this.vehicle, this.data, required this.function})
      : super(key: key);

  @override
  State<SuperAdminVehicleReportCard> createState() =>
      _SuperAdminVehicleReportCardState();
}

TextEditingController rfid = TextEditingController();
TextEditingController _message = TextEditingController();

class _SuperAdminVehicleReportCardState
    extends State<SuperAdminVehicleReportCard> {
  callMessage(message) {
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
                Navigator.of(context).pop();
              },
              child: const Text("ok"))
        ],
      ),
    );
  }

  _buildMessageBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextForForm(
          text: 'Give Decline Reason',
        ),
        Container(
          decoration: BoxDecoration(
            color: color.AppColor.landingPage2,
          ),
          child: TextFormField(
            minLines: 2,
            maxLines: 5,
            controller: _message,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'Enter Decline Reason', border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  declineReasonForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Center(child: Text('Declined Reason')),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextForForm(text: widget.vehicle.fullName),
              _buildMessageBox(),
              SizedBox(
                height: 20.h,
              ),
              ActionPageButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    declinedReason();
                  },
                  text: 'Send Message'),
            ],
          ),
        ),
      ),
    );
  }

  declinedReason() async {
    if (_message.text.isEmpty) {
      var data = await Services().declineReason(
          fullName: widget.vehicle.fullName,
          msisdn: widget.vehicle.msisdn,
          email: widget.vehicle.email,
          guid: widget.vehicle.guid,
          message: _message.text,
          userGroup: widget.data?.usr_group,
          actionUser: widget.data?.resident_code);
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    var data = await Services().declineReason(
        fullName: widget.vehicle.fullName,
        msisdn: widget.vehicle.msisdn,
        email: widget.vehicle.email,
        guid: widget.vehicle.guid,
        message: _message.text,
        userGroup: widget.data?.usr_group,
        actionUser: widget.data?.resident_code);
    var message = data['message'];
    callMessage(message);
    widget.function();
    _message.clear();
  }

  approveDecline(action) async {
    var data = await Services().approveDeclineVehicle(
        action, widget.data?.resident_code, widget.vehicle.guid);
    var message = data['message'];
    widget.function();
    callMessage(message);
  }

  popMessage(action) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure you want to decline this vehicle?'),
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
                  approveDecline(action);
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

  issueRfid() async {
    var data = await Services().issueRfid(
        guidId: widget.vehicle.guid,
        rfid: rfid.text,
        userGroup: widget.data?.usr_group,
        actionUser: widget.data?.resident_code);
    if(rfid.text.isEmpty){
      var message = data['error']['message'];
      callMessage(message);
      return;
    }
    var message =  data['message'];
    callMessage(message);
    widget.function();
    rfid.clear();
  }

  revokeRfid() async {
    var data = await Services().revokeRfid(
        rfid: widget.vehicle.rfid,
        userGroup: widget.data?.usr_group,
        actionUser: widget.data?.resident_code);
    var message =  data['message'];
    callMessage(message);
    widget.function();

  }

  activateRfid() async {
    var data = await Services().activateRfid(
        residentCode: widget.vehicle.residentCode,
        userGroup: widget.data?.usr_group,
        actionUser: widget.data?.resident_code);
    callMessage(data['message']);
    widget.function();
  }

  deactivateRfid() async {
    var data = await Services().deactivateRfid(
        residentCode: widget.vehicle.residentCode,
        userGroup: widget.data?.usr_group,
        actionUser: widget.data?.resident_code);
    callMessage(data['message']);
    widget.function();
  }

  issueRfidForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Center(child: Text('Issue RFID')),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextForForm(text: widget.vehicle.fullName),
              NameTextField(
                  controller: rfid, hint: "Enter RFID", nameType: "RFID"),
              SizedBox(
                height: 20.h,
              ),
              ActionPageButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    issueRfid();
                  },
                  text: 'Issue Rfid'),
            ],
          ),
        ),
      ),
    );
  }

  openFile() async {
    print(widget.vehicle.doc);
    var url = widget.vehicle.doc ?? '';

    if (url.contains('.doc') || url.contains('.dox')) {
      final uri = Uri.parse(url);
      launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MobileWebView(data: widget.vehicle.doc)));
  }

  String? eventDecision;
  final eventDecisionOptions = [
    'Actions',
    'Approved',
    'Declined',
    'Declined Reason',
    'Issue RFID',
    'Revoke RFID',
    'Activate',
    'Deactivate'
  ];
  String? selectedValue;

  _buildEventDecision() {
    selectedValue = eventDecisionOptions[0];
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: (String? newValue) {
          if (newValue == 'Issue RFID') {
            issueRfidForm();
          } else if (newValue == 'Declined Reason') {
            declineReasonForm();
          } else if (newValue == 'Approved') {
            approveDecline(newValue);
          } else if (newValue == 'Revoke RFID') {
            revokeRfid();
          } else if (newValue == 'Activate') {
            activateRfid();
          } else if (newValue == 'Deactivate') {
            deactivateRfid();
          } else if (newValue == "Declined") {
            popMessage(newValue);
          }
        },
        items:
            eventDecisionOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: value == 'Actions'
                  ? Text(
                      value,
                      style: TextStyle(color: color.AppColor.homePageTitle),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: value == 'Approved'
                              ? color.AppColor.verifiedColor
                              : value == 'Declined'
                                  ? color.AppColor.decline
                                  : value == 'Declined Reason'
                                      ? color.AppColor.card
                                      : value == 'Issue RFID'
                                          ? color.AppColor.homePageTheme
                                          : value == 'Revoke RFID'
                                              ? color.AppColor.revokedAccess
                                              : value == 'Activate'
                                                  ? color.AppColor.activate
                                                  : color.AppColor.deactivate,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          value,
                        ),
                      )));
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.vehicle.tstamp ?? '',
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  color: widget.vehicle.status == 'Approved'
                      ? color.AppColor.verifiedColor
                      : widget.vehicle.status == 'Unapproved'
                          ? color.AppColor.homePageTheme
                          : color.AppColor.decline,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(widget.vehicle.status ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            trailing: _buildEventDecision(),
          ),
          ListTile(
            title: const Text("Surname"),
            trailing: Text(widget.vehicle.surname ?? ''),
          ),
          ListTile(
            title: const Text("First Name"),
            trailing: Text(widget.vehicle.firstname ?? ''),
          ),
          ListTile(
            title: const Text("Full Name"),
            trailing: Text(widget.vehicle.fullName ?? ''),
          ),
          ListTile(
            title: const Text('Resident Code'),
            trailing: Text(widget.vehicle.residentCode ?? ''),
          ),
          ListTile(
            title: const Text('Zone'),
            trailing: Text(widget.vehicle.mraZone ?? ''),
          ),
          ListTile(
            title: const Text('Mobile Number'),
            trailing: Text(widget.vehicle.msisdn ?? ''),
          ),
          ListTile(
            title: const Text('Email'),
            trailing: Text(widget.vehicle.email ?? ''),
          ),
          ListTile(
            title: const Text("MRA dues receipt No"),
            trailing: Text(widget.vehicle.receiptNo ?? ''),
          ),
          ListTile(
            title: const Text('Vehicle Registration No'),
            trailing: Text(widget.vehicle.registrationNo ?? ""),
          ),
          ListTile(
            title: const Text('Registration State'),
            trailing: Text(widget.vehicle.govAgency ?? ""),
          ),
          ListTile(
            title: const Text('Make'),
            trailing: Text(widget.vehicle.make ?? ""),
          ),
          ListTile(
            title: const Text('Vehicle Code'),
            trailing: Text(widget.vehicle.vehicleNo ?? ''),
          ),
          ListTile(
            title: const Text("Colour"),
            trailing: Text(widget.vehicle.color ?? ""),
          ),
          ListTile(
            title: const Text("Model"),
            trailing: Text(widget.vehicle.model ?? ""),
          ),
          ListTile(
            title: const Text("Amount Paid"),
            trailing: Text(widget.vehicle.amount ?? ""),
          ),
          ListTile(
            title: const Text('RFID Date'),
            trailing: Text(widget.vehicle.rfidDate ?? ''),
          ),
          ListTile(
            title: const Text('RFID'),
            trailing: Text(widget.vehicle.rfid ?? ''),
          ),
          ListTile(
            title: const Text('RFID Status'),
            trailing: Text(widget.vehicle.rfidActivationStatus ?? ""),
          ),
          ListTile(
            title: const Text("Uploaded File"),
            trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: InkWell(
                    onTap: openFile,
                    child: Text(
                      widget.vehicle.docName ?? "",
                      style: TextStyle(
                        color: color.AppColor.verifiedColor,
                      ),
                    ))),
          ),
          ListTile(
            title: const Text("Decline Message"),
            trailing: Container(
                alignment: Alignment.centerRight,
                width: 180.w,
                child: Text(
                  widget.vehicle.declineMessage ?? "",
                  style: TextStyle(
                    color: color.AppColor.verifiedColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
