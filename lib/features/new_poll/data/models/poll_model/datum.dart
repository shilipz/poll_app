import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';
import 'response.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'user_type')
  List<dynamic>? userType;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  String? topic;
  String? statement;
  @JsonKey(name: 'poll_type')
  String? pollType;
  @JsonKey(name: 'text_options')
  List<String>? textOptions;
  @JsonKey(name: 'news_id')
  dynamic newsId;
  @JsonKey(name: 'no_of_likes')
  int? noOfLikes;
  @JsonKey(name: 'no_of_dislikes')
  int? noOfDislikes;
  @JsonKey(name: 'is_anonymous')
  bool? isAnonymous;
  List<dynamic>? comments;
  @JsonKey(name: 'users_interacted')
  List<dynamic>? usersInteracted;
  Response? response;

  Datum({
    this.id,
    this.userType,
    this.createdAt,
    this.createdBy,
    this.topic,
    this.statement,
    this.pollType,
    this.textOptions,
    this.newsId,
    this.noOfLikes,
    this.noOfDislikes,
    this.isAnonymous,
    this.comments,
    this.usersInteracted,
    this.response,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
