import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/event_model.dart';

part 'event_state.freezed.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.failure(String message) = _Failure;
  const factory EventState.loading() = _Loading;
  const factory EventState.data(EventModel event) = _Data;
}
