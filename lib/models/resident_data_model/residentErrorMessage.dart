import 'package:json_annotation/json_annotation.dart';


part 'residentErrorMessage.g.dart';

@JsonSerializable()
class ResidentErrorHandler {
  String? status;
  String? message;


  ResidentErrorHandler({this.status, this.message});

  factory ResidentErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$ResidentErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentErrorHandlerToJson(this);
}