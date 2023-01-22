import 'package:flutter/material.dart';

import '../../../components/textfields_types/category_drop_down_list.dart';
import '../../../components/textfields_types/mobile_num_textfield.dart';
import '../../../components/textfields_types/name_textfield.dart';
import '../../../models/resident_data_model/residentdata.dart';

class CommercialEditProfile extends StatefulWidget {
  ResidentModel? data;
  final businessAddress,
      businessName,
      staffNumber,
      businessMobileNumber,
      businessEmail,
      category,
      onChange;

  CommercialEditProfile(
      {Key? key,
      this.businessName,
      this.businessAddress,
      this.businessMobileNumber,
      this.staffNumber,
      this.data,
      this.businessEmail,
      this.category,
      this.onChange})
      : super(key: key);

  @override
  State<CommercialEditProfile> createState() => _CommercialEditProfileState();
}

class _CommercialEditProfileState extends State<CommercialEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameTextField(
            controller: widget.businessAddress,
            hint: widget.data?.street_address ?? "Enter Business Address",
            nameType: "Business Address"),
        NameTextField(
            controller: widget.businessName,
            hint: widget.data?.Business_name ?? "Enter Business Name",
            nameType: "Business Name"),
        MobileNumberTextField(
            controller: widget.businessMobileNumber,
            fieldName: 'Business Mobile Number',
            hintText: widget.data?.mobile_number ??
                'Enter your business mobile number'),
        MobileNumberTextField(
            controller: widget.staffNumber,
            fieldName: 'Staff Number',
            hintText: 'Enter your staff number'),
        NameTextField(
            controller: widget.businessEmail,
            hint: widget.data?.business_email ?? "Enter Business Email",
            nameType: "Business Email"),
        BuildCategoryDropDownList(
          category: widget.category,
          onChanged: widget.onChange,
        )
      ],
    );
  }
}
