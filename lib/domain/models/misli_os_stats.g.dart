// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misli_os_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MisliOsStats _$MisliOsStatsFromJson(Map<String, dynamic> json) => MisliOsStats(
      projects: json['projects'] as int,
      members: json['members'] as int,
      honorableMembers: json['honorableMembers'] as int,
    );

Map<String, dynamic> _$MisliOsStatsToJson(MisliOsStats instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'members': instance.members,
      'honorableMembers': instance.honorableMembers,
    };
