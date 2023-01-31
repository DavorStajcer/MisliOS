import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/go_to_top_offset_provider/go_to_top_offset_provider.dart';
import 'package:misli_os_app/domain/providers/page_scroll_controller_provider/page_scroll_conroller_probider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_text.dart';

class GoToTop extends ConsumerWidget {
  const GoToTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topOffset = ref.watch(goToTopOffsetProvider);
    final scrollController = ref.read(pageScrollControllerProvider);
    log('gototop: topOffset $topOffset, scrollController $scrollController');
    return Positioned(
      right: 50,
      top: topOffset,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: GestureDetector(
          onTap: () {
            scrollController.jumpTo(0);
          },
          child: HoverText(
            AppStrings.vratiSeNaVrh,
            hoveredStyle:
                AppTextStyles.normal.copyWith(color: AppColors.ternary),
            style: AppTextStyles.normal.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
