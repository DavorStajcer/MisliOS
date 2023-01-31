import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/domain/providers/page_scroll_controller_provider/page_scroll_conroller_probider.dart';

final goToTopOffsetProvider =
    StateNotifierProvider<GoToTopOffsetNotifier, double>((ref) {
  final windowSize = ref.watch(windowSizeProvider);
  final pageScrollController = ref.read(pageScrollControllerProvider);
  final initialOffset = windowSize.when(
    undefined: () => -1000,
    full: (size) => size.height,
    medium: (size) => size.height,
    small: (size) => size.height,
  );
  return GoToTopOffsetNotifier(pageScrollController, initialOffset.toDouble());
});

class GoToTopOffsetNotifier extends StateNotifier<double> {
  final ScrollController _pageScrollController;
  final double initialHeight;
  GoToTopOffsetNotifier(this._pageScrollController, this.initialHeight)
      : super(initialHeight) {
    _pageScrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (!mounted) {
      return;
    }
    if (_pageScrollController.offset < 150) {
      state = initialHeight;
      return;
    }
    if (_pageScrollController.offset > 250) {
      return state;
    }
    state = initialHeight - (_pageScrollController.offset - 150);
  }
}
