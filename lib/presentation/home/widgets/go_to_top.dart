import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/go_to_top_offset_provider/go_to_top_offset_provider.dart';
import 'package:misli_os_app/presentation/common/hover_text.dart';
import 'package:misli_os_app/presentation/common/text_styles.dart';

class GoToTop extends ConsumerWidget {
  const GoToTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topOffset = ref.watch(goToTopOffsetProvider);
    return Positioned(
      right: 50,
      top: topOffset,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: HoverText(
          'Vrati se na vrh',
          hoveredStyle: TextStyles.normal.copyWith(color: Colors.white60),
          style: TextStyles.normal.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
