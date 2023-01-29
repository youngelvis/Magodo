import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magodo/models/event_requestModel/event_requestModel.dart';
import 'package:magodo/services/services.dart';
import '/../../components/components_for_class_of_varable/colors.dart' as color;
class EventRequestReportCard extends StatefulWidget {
  EventReport data;

  EventRequestReportCard({Key? key, required this.data}) : super(key: key);

  @override
  State<EventRequestReportCard> createState() => _EventRequestReportCardState();
}

class _EventRequestReportCardState extends State<EventRequestReportCard> {
  String? eventDecision;
  final eventDecisionOptions = [
   'Actions',
    'Approve',
    'Decline',
  ];
  String? selectedValue;

  selectedDecision() async {
    await Services().approveEventRequest(
        widget.data.passcode, selectedValue, widget.data.id);

  }

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
          setState(() {
            selectedValue = newValue!;
          });
          selectedDecision();
        },
        items:
            eventDecisionOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child:value== 'Actions' ? Text(
                value, style: TextStyle(color: color.AppColor.homePageTitle),
              ): Container(
                  decoration: BoxDecoration(
                      color: value == 'Approve' ? Colors.green :Colors.red,
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
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                widget.data.createdDate ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.eventType ?? '',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(widget.data.passcode ?? ''),
              trailing: Container(
                decoration: BoxDecoration(
                    color: widget.data.status == 'Approved'
                        ? color.AppColor.verifiedColor
                        : widget.data.status == 'Unapproved' ? color.AppColor.homePageTheme: color.AppColor.decline,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(widget.data.status ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            ListTile(trailing: _buildEventDecision()),
            ListTile(
              title:  Text(
                'Name',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190.w,
                child: Text(
                  widget.data.fullname ?? '',
                  style:  TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
            ListTile(
              title:  Text(
                'Population',
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Text(
                widget.data.population ?? '',
                style:  TextStyle(fontSize: 15.sp),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
