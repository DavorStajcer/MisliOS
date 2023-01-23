import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';

part 'home_tab_custom.g.dart';

@JsonSerializable()
class HomeTabCustom extends HomeTab {
  final String body;
  HomeTabCustom({
    required super.type,
    required super.text,
    required this.body,
  });

  factory HomeTabCustom.fromJson(Map<String, dynamic> json) =>
      _$HomeTabCustomFromJson(json);
}
