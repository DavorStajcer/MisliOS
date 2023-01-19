import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_state.freezed.dart';

@freezed
class TabState with _$TabState {
  const factory TabState.unselected() = _Unselected;
  const factory TabState.selected() = _Selected;
  const factory TabState.hovered() = _Hovered;
}
