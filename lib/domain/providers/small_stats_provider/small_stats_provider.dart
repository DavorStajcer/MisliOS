import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/domain/models/misli_os_stats.dart';

final smallStatsProvider = Provider<List<List<MisliOsStat>>>((ref) {
  final statsState = ref.watch(statsNotifierProvider);
  final groupsOfTwo = statsState.maybeWhen<List<List<MisliOsStat>>>(
    data: (stats) => _separateIntoGroupsOfTwo(stats),
    orElse: () => [],
  );
  return groupsOfTwo;
});

List<List<MisliOsStat>> _separateIntoGroupsOfTwo(List<MisliOsStat> stats) {
  final List<List<MisliOsStat>> groupsOfTwo = [];
  int groupsIndex = 0;
  groupsOfTwo.add([]);

  for (var i = 0; i < stats.length; i++) {
    groupsOfTwo[groupsIndex].add(stats[i]);
    if (groupsOfTwo[groupsIndex].length == 2) {
      groupsIndex++;
      if (i < stats.length - 1) {
        groupsOfTwo.add([]);
      }
    }
  }
  return [...groupsOfTwo];
}
