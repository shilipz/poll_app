import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'poll_model.g.dart';

@JsonSerializable()
class PollModel {
  List<Datum>? data;

  PollModel({this.data});

  factory PollModel.fromJson(Map<String, dynamic> json) {
    return _$PollModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollModelToJson(this);
}
