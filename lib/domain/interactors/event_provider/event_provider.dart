import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/events_repository.dart';
import 'package:misli_os_app/domain/interactors/event_provider/event_state.dart';

final eventNotifierProvider = StateNotifierProvider.family
    .call<EventNotifier, EventState, String>((ref, eventId) {
  final eventsRepo = ref.read(eventsRepositoryProvider);
  return EventNotifier(eventsRepo)..fetchEvent(eventId);
});

class EventNotifier extends StateNotifier<EventState> {
  final EventsRepository _eventsRepository;
  EventNotifier(this._eventsRepository) : super(const EventState.loading());

  Future<void> fetchEvent(String id) async {
    state = const EventState.loading();
    try {
      final event = await _eventsRepository.getEvent(id);
      state = EventState.data(event);
    } on AppException catch (e) {
      state = EventState.failure(e.message);
    }
  }

  reloadEvent(String id, {bool force = false}) {
    state.maybeWhen(
      data: (_) async {
        if (force) {
          await fetchEvent(id);
        }
      },
      orElse: () async => await fetchEvent(id),
    );
  }
}
