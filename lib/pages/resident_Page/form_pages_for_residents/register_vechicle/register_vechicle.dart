import 'package:flutter/material.dart';
import 'package:magodo/components/app_page_theme_action_button.dart';
import 'package:magodo/components/roundedDropDownTextfield.dart';
import 'package:magodo/components/text_for_form.dart';
import 'package:magodo/components/textfields_types/mobile_num_textfield.dart';
import 'package:magodo/components/textfields_types/name_textfield.dart';
import 'package:magodo/pages/resident_Page/form_pages_for_residents/get_future_passcode/get_passcode_title.dart';

class RegisterVechicle extends StatefulWidget {
  final data;

  const RegisterVechicle({Key? key, required this.data}) : super(key: key);

  @override
  State<RegisterVechicle> createState() => _RegisterVechicleState();
}

class _RegisterVechicleState extends State<RegisterVechicle> {
  TextEditingController _vechicleCode = TextEditingController();
  TextEditingController _vehicleMake = TextEditingController();
  TextEditingController _vechicleModel = TextEditingController();
  TextEditingController _govtAgency = TextEditingController();
  TextEditingController _registrationNumber = TextEditingController();
  TextEditingController _mraDuesRecieptNo = TextEditingController();
  TextEditingController _amountPaid = TextEditingController();
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

  Widget _buildPopulationType() {
    return RoundedDropDownTextField(
      hint: const Text(
        'Choose colour',
        style: TextStyle(fontSize: 15),
      ),
      value: colour,
      onChanged: (value) => setState(() {
        colour = value as String;
      }),
      items: colourOptions.map(buildColourItem).toList(),
    );
  }

  DropdownMenuItem<String> buildColourItem(String colourOptions) =>
      DropdownMenuItem(
        value: colourOptions,
        child: Text(
          colourOptions,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
      );

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
                  title: 'Event Request',
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    Text(
                      'Event request form',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
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
                                  controller: _vechicleCode,
                                  hint: "Enter code",
                                  nameType: "Vehicle Code"),
                              NameTextField(
                                  controller: _vehicleMake,
                                  hint: "Enter make of vehicle",
                                  nameType: "Email (Optional)"),
                              NameTextField(
                                  controller: _vechicleModel,
                                  hint: "Enter model of vehicle",
                                  nameType: "Vehicle Make"),
                              const TextForForm(text: "Vehicle Colour"),
                              _buildPopulationType(),
                              NameTextField(
                                  controller: _govtAgency,
                                  hint: "gov agency",
                                  nameType: "Gov Agency"),
                              NameTextField(
                                  controller: _registrationNumber,
                                  hint: "Registration number",
                                  nameType: "Registration No"),
                              NameTextField(
                                  controller: _mraDuesRecieptNo,
                                  hint: "mra reciept number",
                                  nameType: "Mra Dues Reciept No"),
                              MobileNumberTextField(
                                  controller: _amountPaid,
                                  fieldName: '(₦)Amount Paid',
                                  hintText: 'Enter amount paid'),
                              const SizedBox(
                                height: 20,
                              ),
                              ActionPageButton(
                                  onPressed: () async {},
                                  text: 'Submit Request'),
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
