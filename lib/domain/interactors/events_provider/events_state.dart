import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/event_model.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.failure(String message) = _Failure;
  const factory EventsState.loading() = _Loading;
  const factory EventsState.data(List<EventModel> eventBodies) = _Data;
}
