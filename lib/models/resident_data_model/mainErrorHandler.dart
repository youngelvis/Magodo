import 'package:json_annotation/json_annotation.dart';
part 'mainErrorHandler.g.dart';

@JsonSerializable()
class MainErrorHandler {
 MainErrorHandler? error;


  MainErrorHandler({this.error});

  factory MainErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$MainErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$MainErrorHandlerToJson(this);
}