// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as String,
      previewHtml: json['previewHtml'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      previewImageUrl: json['previewImageUrl'] as String,
      html: json['html'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previewHtml': instance.previewHtml,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'previewImageUrl': instance.previewImageUrl,
      'html': instance.html,
    };
