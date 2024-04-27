// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['_id'] as String?,
      userType: json['user_type'] as List<dynamic>?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
      statement: json['statement'] as String?,
      pollType: json['poll_type'] as String?,
      textOptions: (json['text_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newsId: json['news_id'],
      noOfLikes: json['no_of_likes'] as int?,
      noOfDislikes: json['no_of_dislikes'] as int?,
      isAnonymous: json['is_anonymous'] as bool?,
      comments: json['comments'] as List<dynamic>?,
      usersInteracted: json['users_interacted'] as List<dynamic>?,
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      '_id': instance.id,
      'user_type': instance.userType,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'topic': instance.topic,
      'statement': instance.statement,
      'poll_type': instance.pollType,
      'text_options': instance.textOptions,
      'news_id': instance.newsId,
      'no_of_likes': instance.noOfLikes,
      'no_of_dislikes': instance.noOfDislikes,
      'is_anonymous': instance.isAnonymous,
      'comments': instance.comments,
      'users_interacted': instance.usersInteracted,
      'response': instance.response,
    };
