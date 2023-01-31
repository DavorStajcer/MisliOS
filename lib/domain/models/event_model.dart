import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  final String id;
  final String previewHtml;
  final DateTime dateCreated;
  final String previewImageUrl;
  final String html;
  EventModel({
    required this.id,
    required this.previewHtml,
    required this.dateCreated,
    required this.previewImageUrl,
    required this.html,
  });
  factory EventModel.fromJson(String id, Map<String, dynamic> json) =>
      EventModel(
        id: id,
        previewHtml: json['previewHtml'] as String,
        dateCreated: DateTime.parse(json['dateCreated'] as String),
        previewImageUrl: json['previewImageUrl'] as String,
        html: json['html'] as String,
      );

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
