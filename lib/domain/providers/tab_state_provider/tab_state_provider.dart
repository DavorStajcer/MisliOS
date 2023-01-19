import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/tab_hovered_provider/tab_hovered_provider.dart';
import 'package:misli_os_app/domain/providers/tab_selected_provider/tab_selected_provider.dart';
import 'package:misli_os_app/domain/providers/tab_state_provider/tab_state.dart';

final tabStateProvider = StateProvider.family<TabState, int>((ref, tabIndex) {
  final selectedTab = ref.watch(tabSelectedProvider);
  final hoveredTab = ref.watch(tabHoveredProvider);
  if (selectedTab == tabIndex) {
    return const TabState.selected();
  }
  if (hoveredTab == tabIndex) {
    return const TabState.hovered();
  }
  return const TabState.unselected();
});
