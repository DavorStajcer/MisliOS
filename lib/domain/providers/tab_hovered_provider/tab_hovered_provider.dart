import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabHoveredProvider =
    StateNotifierProvider<TabHoveredNotifier, int?>((ref) {
  return TabHoveredNotifier();
});

class TabHoveredNotifier extends StateNotifier<int?> {
  TabHoveredNotifier() : super(0);

  onTabHovered(int? tab) {
    state = tab;
  }
}
