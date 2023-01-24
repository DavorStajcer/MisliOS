import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_borders.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_state.dart';

final windowSizeProvider =
    StateNotifierProvider<WidnowSizeNotifier, WindowSizeState>((ref) {
  return WidnowSizeNotifier();
});

class WidnowSizeNotifier extends StateNotifier<WindowSizeState> {
  WidnowSizeNotifier() : super(const WindowSizeState.undefined());

  onWidnowSizeChanged(Size screenSize) {
    if (screenSize.width > WidowSizeBorders.minWidthFull) {
      state = WindowSizeState.full(screenSize);
      return;
    } else if (screenSize.width > WidowSizeBorders.minWidthMedium) {
      state = WindowSizeState.medium(screenSize);
      return;
    }
    state = WindowSizeState.small(screenSize);
  }
}
