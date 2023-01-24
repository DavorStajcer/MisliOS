import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/tabs_repository.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_state.dart';

final tabsNotifierProbider =
    StateNotifierProvider<TabsNotifier, TabsState>((ref) {
  final tabsRepo = ref.read(tabsRepositoryProvider);
  return TabsNotifier(tabsRepo)..fetchTabs();
});

class TabsNotifier extends StateNotifier<TabsState> {
  final TabsRepository _tabsRepository;
  TabsNotifier(this._tabsRepository) : super(const TabsState.loading());

  fetchTabs() async {
    state = const TabsState.loading();
    try {
      final tabs = await _tabsRepository.getTabs();
      state = TabsState.data(tabs);
    } on AppException catch (e) {
      state = TabsState.failure(e.message);
    }
  }

  reloadHomePage({bool force = false}) {
    state.maybeWhen(
      data: (_) async {
        if (force) {
          await fetchTabs();
        }
      },
      orElse: () async => await fetchTabs(),
    );
  }
}
