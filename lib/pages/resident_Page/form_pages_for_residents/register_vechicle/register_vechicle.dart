import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/components/textfields_types/vehicle_color_dropdown_list.dart';
import 'package:magodo/models/resident_data_model/residentdata.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';
import 'package:magodo/services/services.dart';

class RegisterVehicle extends StatefulWidget {
  ResidentModel? data;

   RegisterVehicle({Key? key, required this.data}) : super(key: key);

  @override
  State<RegisterVehicle> createState() => _RegisterVehicleState();
}

TextEditingController _vehicleCode = TextEditingController();
TextEditingController _vehicleMake = TextEditingController();
TextEditingController _vehicleModel = TextEditingController();
TextEditingController _govtAgency = TextEditingController();
TextEditingController _registrationNumber = TextEditingController();
TextEditingController _mraDuesReceiptNo = TextEditingController();
TextEditingController _amountPaid = TextEditingController();

class _RegisterVehicleState extends State<RegisterVehicle> {
  String? colour;
  final colourOptions = [
    'White',
    'Red',
    'Blue',
    'Green',
    'Grey',
    'Silver',
    'Brown',
    'Orange',
    'Yellow',
    'Light blue',
    'Tan',
    'Dark red',
    'Dark green',
    'Gold',
    'Purple',
    'Wine'
  ];

  late File file;

  Future selectFile() async {
    file = File(await Services().selectFile());
    print('this is a ${file}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                GetPasscodeTitleContainer(
                  title: 'Resident Vehicle',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Resident Vehicle',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                ),
                const Text(
                  'upload vehicle licence and supporting document',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: OverflowBox(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameTextField(
                                  controller: _vehicleCode,
                                  hint: "Enter code",
                                  nameType: "Vehicle Code"),
                              NameTextField(
                                  controller: _vehicleMake,
                                  hint: "Enter make of vehicle",
                                  nameType: "Email (Optional)"),
                              NameTextField(
                                  controller: _vehicleModel,
                                  hint: "Enter model of vehicle",
                                  nameType: "Vehicle Make"),
                              BuildVehicleColorDropDownList(
                                  vehicleColor: colour,
                                  onChanged: (value) => setState(() {
                                        colour = value as String;
                                      })),
                              NameTextField(
                                  controller: _govtAgency,
                                  hint: "gov agency",
                                  nameType: "Gov Agency"),
                              NameTextField(
                                  controller: _registrationNumber,
                                  hint: "Registration number",
                                  nameType: "Registration No"),
                              NameTextField(
                                  controller: _mraDuesReceiptNo,
                                  hint: "mra receipt number",
                                  nameType: "Mra Dues Receipt No"),
                              MobileNumberTextField(
                                  controller: _amountPaid,
                                  fieldName: '(₦)Amount Paid',
                                  hintText: 'Enter amount paid'),
                              const TextForForm(text: 'Upload'),
                              SizedBox(
                                  height: 140,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0))),
                                      onPressed: () {},
                                      child: const Icon(Icons.add))),
                              const SizedBox(
                                height: 20,
                              ),
                              ActionPageButton(
                                  onPressed: () async {}, text: 'Submit'),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
    ;
  }
}
