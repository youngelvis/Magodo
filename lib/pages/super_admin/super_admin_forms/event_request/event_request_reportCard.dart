import 'package:flutter/material.dart';
import 'package:magodo/models/event_requestModel/event_requestModel.dart';

class EventRequestReportCard extends StatefulWidget {
  EventReport data;

  EventRequestReportCard({Key? key, required this.data}) : super(key: key);

  @override
  State<EventRequestReportCard> createState() => _EventRequestReportCardState();
}

class _EventRequestReportCardState extends State<EventRequestReportCard> {
  String? eventDecision;
  final eventDecisionOptions = [
    '-- Action --',
    'Accepted',
    'Declined',
  ];

  _buildEventDecision() {
    String? selectedValue = eventDecisionOptions[0];
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.white,),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items:
            eventDecisionOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(backgroundColor: value == 'Accepted' ? Colors.green : Colors.red)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                widget.data.createdDate ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.eventType ?? '',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(widget.data.passcode ?? ''),
              trailing: Text(widget.data.status?? '', style: TextStyle(backgroundColor: widget.data.status == 'Accepted' ? Colors.green : Colors.red)),
            ),
            ListTile(trailing: _buildEventDecision()),

            ListTile(
              title: const Text(
                'Name',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 190,
                child: Text(
                  widget.data.fullname ?? '',
                  style: const TextStyle(fontSize: 15),

                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Population',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                widget.data.population ?? '',
                style: const TextStyle(fontSize: 15),
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
