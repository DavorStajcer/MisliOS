import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/misli_os_stats.dart';

part 'stats_state.freezed.dart';

@freezed
class StatsState with _$StatsState {
  const factory StatsState.failure(String message) = _Failure;
  const factory StatsState.loading() = _Loading;
  const factory StatsState.data(List<MisliOsStat> tabs) = _Data;
}
