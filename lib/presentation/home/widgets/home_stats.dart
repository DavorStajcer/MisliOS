import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/home_stats_full.dart';
import 'package:misli_os_app/presentation/home/widgets/home_stats_small.dart';

class HomeStats extends ConsumerWidget {
  const HomeStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSizeState = ref.watch(windowSizeProvider);
    return windowSizeState.maybeWhen(
      small: (_) => const HomeStatsSmall(),
      medium: (_) => const HomeStatsFull(),
      orElse: () => const HomeStatsFull(),
    );
  }
}
