import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tab.g.dart';

@JsonSerializable()
class HomeTab {
  final String type;
  final String text;

  HomeTab({required this.type, required this.text});

  factory HomeTab.fromJson(Map<String, dynamic> json) =>
      _$HomeTabFromJson(json);

  Map<String, dynamic> toJson() => _$HomeTabToJson(this);
}
