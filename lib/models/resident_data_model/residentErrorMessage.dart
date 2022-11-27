import 'package:json_annotation/json_annotation.dart';


part 'residentErrorMessage.g.dart';

@JsonSerializable()
class MainErrorHandler {
  String? status;
  String? message;


  MainErrorHandler({this.status, this.message});

  factory MainErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$ResidentErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentErrorHandlerToJson(this);
}