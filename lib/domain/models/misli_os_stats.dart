import 'package:freezed_annotation/freezed_annotation.dart';

part 'misli_os_stats.g.dart';

@JsonSerializable()
class MisliOsStats {
  final int projects;
  final int members;
  final int honorableMembers;
  MisliOsStats({
    required this.projects,
    required this.members,
    required this.honorableMembers,
  });

  factory MisliOsStats.fromJson(Map<String, dynamic> json) =>
      _$MisliOsStatsFromJson(json);

  Map<String, dynamic> toJson() => _$MisliOsStatsToJson(this);
}
