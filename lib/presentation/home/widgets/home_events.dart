import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/home_events_full.dart';
import 'package:misli_os_app/presentation/home/widgets/home_events_medium.dart';

class HomeEvents extends ConsumerWidget {
  const HomeEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSizeState = ref.watch(windowSizeProvider);
    return windowSizeState.when(
      full: (Size size) => const HomeEventsFull(),
      medium: (Size size) => const HomeEventsMedium(),
      small: (Size size) => const HomeEventsMedium(),
      undefined: () => const SizedBox(),
    );
  }
}
