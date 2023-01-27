import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/stat_text.dart';

class HomeStatsFull extends ConsumerWidget {
  const HomeStatsFull({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.read(statsNotifierProvider);
    log('building stats $statsState');

    return statsState.maybeWhen(
      data: (stats) => Container(
        color: Colors.blue,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            for (var i = 0; i < stats.length; i++)
              StatText(
                label: stats[i].name,
                count: stats[i].count,
              ),
            const SizedBox(),
          ],
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
