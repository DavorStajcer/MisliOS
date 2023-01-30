import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/small_stats_provider/small_stats_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/stat_text.dart';

class HomeStatsSmall extends ConsumerWidget {
  const HomeStatsSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsGroupsOfTwo = ref.watch(smallStatsProvider);

    return Container(
      color: Colors.blue,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var stats in statsGroupsOfTwo)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < stats.length; i++)
                  Container(
                    margin: i == 0 ? const EdgeInsets.only(bottom: 15) : null,
                    child: StatText(
                      label: stats[i].name,
                      count: stats[i].count,
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
