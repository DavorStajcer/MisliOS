// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as String,
      body: json['body'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };
