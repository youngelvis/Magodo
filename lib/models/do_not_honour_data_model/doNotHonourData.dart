import 'package:json_annotation/json_annotation.dart';

part 'doNotHonourData.g.dart';

@JsonSerializable()
class DoNotHonourDataModel {

  String? passcode;
  String? isChecked;

  DoNotHonourDataModel(
      {this.passcode,this.isChecked});

  factory DoNotHonourDataModel.fromJson(Map<String, dynamic> json) =>
      _$DoNotHonourDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoNotHonourDataModelToJson(this);
}
