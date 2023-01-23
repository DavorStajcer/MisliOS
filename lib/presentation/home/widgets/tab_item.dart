import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/domain/providers/tab_hovered_provider/tab_hovered_provider.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';
import 'package:misli_os_app/domain/providers/tab_state_provider/tab_state_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_hovered.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_selected.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_unselected.dart';

class Tabitem extends ConsumerWidget {
  final HomeTab homeTab;
  final int tabIndex;
  const Tabitem({
    super.key,
    required this.homeTab,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(tabStateProvider(tabIndex));
    return MouseRegion(
      onHover: (event) =>
          ref.read(tabHoveredProvider.notifier).onTabHovered(tabIndex),
      onExit: (event) =>
          ref.read(tabHoveredProvider.notifier).onTabHovered(null),
      child: GestureDetector(
        onTap: () => ref.read(tabIndexProvider.notifier).state = tabIndex,
        child: tabState.when(
          unselected: () => TabUnselected(homeTab),
          selected: () => TabSelected(homeTab),
          hovered: () => TabHovered(homeTab),
        ),
      ),
    );
  }
}
