import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_provider.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/domain/providers/home_page_loading_provider/home_page_loading_state.dart';

final homePageLoadingProvider = StateProvider<HomePageLoadingState>((ref) {
  final tabsState = ref.watch(tabsNotifierProbider);
  final statsState = ref.watch(statsNotifierProvider);
  final eventsState = ref.watch(eventsNotifierProvider);

  HomePageLoadingState? homeLoadingState =
      tabsState.maybeMap<HomePageLoadingState?>(
    failure: (failure) => HomePageLoadingState.failure(failure.message),
    loading: (_) => const HomePageLoadingState.loading(),
    orElse: () => null,
  );

  if (homeLoadingState != null) {
    return homeLoadingState;
  }
  homeLoadingState = statsState.maybeMap<HomePageLoadingState>(
    failure: (failure) => HomePageLoadingState.failure(failure.message),
    loading: (_) => const HomePageLoadingState.loading(),
    orElse: () => const HomePageLoadingState.allDataFetched(),
  );
  homeLoadingState = eventsState.maybeMap<HomePageLoadingState>(
    failure: (failure) => HomePageLoadingState.failure(failure.message),
    loading: (_) => const HomePageLoadingState.loading(),
    orElse: () => const HomePageLoadingState.allDataFetched(),
  );
  return homeLoadingState;
});
