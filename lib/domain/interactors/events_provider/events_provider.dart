import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/events_repository.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_state.dart';

final eventsNotifierProvider =
    StateNotifierProvider<EventsNotifier, EventsState>((ref) {
  final eventsRepo = ref.read(eventsRepositoryProvider);
  return EventsNotifier(eventsRepo)..fetchStats();
});

class EventsNotifier extends StateNotifier<EventsState> {
  final EventsRepository _eventsRepository;
  EventsNotifier(this._eventsRepository) : super(const EventsState.loading());

  Future<void> fetchStats() async {
    state = const EventsState.loading();
    try {
      final misliOsStats = await _eventsRepository.getEvents();
      state = EventsState.data(misliOsStats);
    } on AppException catch (e) {
      state = EventsState.failure(e.message);
    }
  }

  reloadHomePage({bool force = false}) {
    state.maybeWhen(
      data: (_) async {
        if (force) {
          await fetchStats();
        }
      },
      orElse: () async => await fetchStats(),
    );
  }
}
