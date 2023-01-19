import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';

part 'tabs_state.freezed.dart';

@freezed
class TabsState with _$TabsState {
  const factory TabsState.failure(String message) = _Failure;
  const factory TabsState.loading() = _Loading;
  const factory TabsState.data(List<HomeTab> tabs) = _Data;
}
