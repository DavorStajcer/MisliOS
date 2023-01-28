import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  final String id;
  final String body;
  final DateTime dateCreated;
  final String imageUrl;
  EventModel({
    required this.id,
    required this.body,
    required this.dateCreated,
    required this.imageUrl,
  });
  factory EventModel.fromJson(String id, Map<String, dynamic> json) =>
      EventModel(
        id: id,
        body: json['body'] as String,
        dateCreated: DateTime.parse(json['dateCreated'] as String),
        imageUrl: json['imageUrl'] as String,
      );

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
