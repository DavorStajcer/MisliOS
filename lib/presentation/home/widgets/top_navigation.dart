import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_big.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_medium.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation_small.dart';

class TopNavigation extends ConsumerWidget {
  final bool showDivider;
  const TopNavigation({
    Key? key,
    this.showDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(windowSizeProvider);
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: size.when(
            undefined: () => const SizedBox(),
            full: (_) => const TopNavigationBig(),
            medium: (_) => const TopNavigationMedium(),
            small: (_) => const TopNavigationSmall(),
          ),
        ),
        if (showDivider)
          Divider(
            color: AppColors.secondary,
            thickness: 0.5,
            height: 1,
          ),
      ],
    );
  }
}
