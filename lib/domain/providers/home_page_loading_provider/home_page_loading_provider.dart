import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_provider.dart';
import 'package:misli_os_app/domain/interactors/main_image_provider/main_image_provider.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/domain/providers/home_page_loading_provider/home_page_loading_state.dart';

final homePageLoadingProvider = StateProvider<HomePageLoadingState>((ref) {
  final tabsState = ref.watch(tabsNotifierProbider);
  final statsState = ref.watch(statsNotifierProvider);
  final mainImageState = ref.watch(mainImageProvider);
  final eventsState = ref.watch(eventsNotifierProvider);

  log('---------');
  log(tabsState.toString());
  log(statsState.toString());
  log(eventsState.toString());
  log(mainImageState.toString());
  log('---------');

  final tabsFailure = tabsState.whenOrNull(
    failure: (message) => HomePageLoadingState.failure(message),
  );
  if (tabsFailure != null) {
    return tabsFailure;
  }
  final statsFailure = statsState.whenOrNull(
    failure: (message) => HomePageLoadingState.failure(message),
  );
  if (statsFailure != null) {
    return statsFailure;
  }
  final mainImageFailure = mainImageState.whenOrNull(
    failure: (message) => HomePageLoadingState.failure(message),
  );
  if (mainImageFailure != null) {
    return mainImageFailure;
  }
  final eventsFailure = eventsState.whenOrNull(
    failure: (message) => HomePageLoadingState.failure(message),
  );
  if (eventsFailure != null) {
    return eventsFailure;
  }

  final tabsLoading = tabsState.whenOrNull(
    loading: () => const HomePageLoadingState.loading(),
  );
  if (tabsLoading != null) {
    return tabsLoading;
  }

  final statsLoading = statsState.whenOrNull(
    loading: () => const HomePageLoadingState.loading(),
  );
  if (statsLoading != null) {
    return statsLoading;
  }

  final eventsLoading = eventsState.whenOrNull(
    loading: () => const HomePageLoadingState.loading(),
  );
  if (eventsLoading != null) {
    return eventsLoading;
  }

  final mainImageLoading = mainImageState.whenOrNull(
    loading: () => const HomePageLoadingState.loading(),
  );
  if (mainImageLoading != null) {
    return mainImageLoading;
  }

  return const HomePageLoadingState.allDataFetched();
});
