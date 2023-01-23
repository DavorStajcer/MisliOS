import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/tab_hovered_provider/tab_hovered_provider.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';
import 'package:misli_os_app/domain/providers/tab_state_provider/tab_state.dart';

final tabStateProvider = StateProvider.family<TabState, int>((ref, tabIndex) {
  final selectedIndex = ref.watch(tabIndexProvider);
  final hoveredTab = ref.watch(tabHoveredProvider);
  if (selectedIndex == tabIndex) {
    return const TabState.selected();
  }
  if (hoveredTab == tabIndex) {
    return const TabState.hovered();
  }
  return const TabState.unselected();
});
