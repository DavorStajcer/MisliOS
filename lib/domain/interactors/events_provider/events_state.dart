import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.failure(String message) = _Failure;
  const factory EventsState.loading() = _Loading;
  const factory EventsState.data(List<String> eventBodies) = _Data;
}
