import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/stats_repository.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_state.dart';

final statsNotifierProvider =
    StateNotifierProvider<StasNotifier, StatsState>((ref) {
  final statsRepo = ref.read(statsRepositoryProvider);
  return StasNotifier(statsRepo)..fetchStats();
});

class StasNotifier extends StateNotifier<StatsState> {
  final StatsRepository _statsRepository;
  StasNotifier(this._statsRepository) : super(const StatsState.loading());

  Future<void> fetchStats() async {
    state = const StatsState.loading();
    try {
      final misliOsStats = await _statsRepository.getStats();
      state = StatsState.data(misliOsStats);
    } on AppException catch (e) {
      state = StatsState.failure(e.message);
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
