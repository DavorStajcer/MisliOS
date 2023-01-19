import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/stat_text.dart';

class HomeStats extends ConsumerWidget {
  const HomeStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.read(statsNotifierProvider);

    return statsState.maybeWhen(
      data: (stats) => Container(
        color: Colors.blue,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            StatText(
              count: stats.projects,
              label: 'Proveden projekt',
            ),
            StatText(
              count: stats.members,
              label: 'Članova udruge',
            ),
            StatText(
              count: stats.honorableMembers,
              label: 'Počasnih članova',
            ),
            const SizedBox(),
          ],
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
