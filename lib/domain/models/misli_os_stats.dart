import 'package:freezed_annotation/freezed_annotation.dart';

part 'misli_os_stats.g.dart';

@JsonSerializable()
class MisliOsStat {
  final String name;
  final int count;
  MisliOsStat({
    required this.name,
    required this.count,
  });

  factory MisliOsStat.fromJson(Map<String, dynamic> json) =>
      _$MisliOsStatFromJson(json);

  Map<String, dynamic> toJson() => _$MisliOsStatToJson(this);
}
