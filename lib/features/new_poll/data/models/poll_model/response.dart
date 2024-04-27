import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'option 1 ')
  List<dynamic>? option1;
  @JsonKey(name: 'option 2')
  List<dynamic>? option2;

  Response({this.option1, this.option2});

  factory Response.fromJson(Map<String, dynamic> json) {
    return _$ResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
