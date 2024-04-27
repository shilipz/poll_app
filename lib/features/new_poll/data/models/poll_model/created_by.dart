import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  dynamic id;
  String? name;

  CreatedBy({this.id, this.name});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
