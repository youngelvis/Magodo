import 'package:json_annotation/json_annotation.dart';
import 'package:magodo/models/resident_data_model/residentErrorMessage.dart';
part 'mainErrorHandler.g.dart';

@JsonSerializable()
class MainErrorHandler {
 ResidentErrorHandler? error;


  MainErrorHandler({this.error});

  factory MainErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$MainErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$MainErrorHandlerToJson(this);
}