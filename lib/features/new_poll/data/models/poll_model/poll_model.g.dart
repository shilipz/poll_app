// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollModel _$PollModelFromJson(Map<String, dynamic> json) => PollModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PollModelToJson(PollModel instance) => <String, dynamic>{
      'data': instance.data,
    };
