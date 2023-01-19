import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabSelectedProvider =
    StateNotifierProvider<TabSelectedNotifier, int>((ref) {
  return TabSelectedNotifier();
});

class TabSelectedNotifier extends StateNotifier<int> {
  TabSelectedNotifier() : super(0);

  onTabSelected(int tab) {
    state = tab;
  }
}
