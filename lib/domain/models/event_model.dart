import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  final String body;
  final DateTime dateCreated;
  final String imageUrl;
  EventModel({
    required this.body,
    required this.dateCreated,
    required this.imageUrl,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
