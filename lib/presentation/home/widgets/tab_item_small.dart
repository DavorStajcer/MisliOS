import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/domain/providers/tab_hovered_provider/tab_hovered_provider.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';
import 'package:misli_os_app/domain/providers/tab_state_provider/tab_state_provider.dart';
import 'package:misli_os_app/presentation/common/values/is_web_mobile.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_hovered.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_hovered_small.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_selected.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_selected_small.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_unselected_small.dart';

class TabitemSmall extends ConsumerWidget {
  final HomeTab homeTab;
  final int tabIndex;
  const TabitemSmall({
    super.key,
    required this.homeTab,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(tabStateProvider(tabIndex));
    final tabWidget = GestureDetector(
      onTap: () {
        ref.read(tabIndexProvider.notifier).state = tabIndex;
        Scaffold.of(context).closeDrawer();
      },
      child: tabState.when(
        unselected: () => TabUnselectedSmall(homeTab),
        selected: () => TabSelectedSmall(homeTab),
        hovered: () => TabHoveredSmall(homeTab),
      ),
    );

    if (kIsWebMobile) {
      return tabWidget;
    }
    return MouseRegion(
      onHover: (event) =>
          ref.read(tabHoveredProvider.notifier).onTabHovered(tabIndex),
      onExit: (event) =>
          ref.read(tabHoveredProvider.notifier).onTabHovered(null),
      child: tabWidget,
    );
  }
}
