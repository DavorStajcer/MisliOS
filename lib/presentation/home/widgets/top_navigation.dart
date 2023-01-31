import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_big.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_medium.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_small.dart';

class TopNavigation extends ConsumerWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(windowSizeProvider);
    return SizedBox(
      height: 100,
      child: size.when(
        undefined: () => const SizedBox(),
        full: (_) => const TopNavigationBig(),
        medium: (_) => const TopNavigationMedium(),
        small: (_) => const TopNavigationSmall(),
      ),
    );
  }
}
