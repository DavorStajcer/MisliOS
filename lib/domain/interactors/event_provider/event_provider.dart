import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/events_repository.dart';
import 'package:misli_os_app/domain/interactors/event_provider/event_state.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_provider.dart';
import 'package:misli_os_app/domain/models/event_model.dart';

/* final eventNotifierProvider = StateNotifierProvider.family
    .call<EventNotifier, EventState, String>((ref, eventId) {
  final eventsState = ref.read(eventsNotifierProvider);
  return EventNotifier(eventsRepo)..fetchEvent(eventId);
}); */
final eventNotifierProvider =
    StateProvider.family.call<EventState, String>((ref, pickedEventId) {
  final eventsState = ref.read(eventsNotifierProvider);
  final eventState = eventsState.map(
    failure: (failure) => EventState.failure(failure.message),
    loading: (_) => const EventState.loading(),
    data: (data) {
      final event = _getPickedEvent(data.events, pickedEventId);
      if (event == null) {
        return EventState.failure('Picked event not found.');
      }
      return EventState.data(event);
    },
  );
  return eventState;
});

EventModel? _getPickedEvent(List<EventModel> events, String pickedEventId) {
  for (var event in events) {
    if (event.id == pickedEventId) {
      return event;
    }
  }
}

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
