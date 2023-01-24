import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';

final tabPickedProvider = StateProvider<HomeTab?>((ref) {
  final tabState = ref.watch(tabsNotifierProbider);
  final pickedTabIndex = ref.watch(tabIndexProvider);
  return tabState.maybeWhen<HomeTab?>(
    data: (tabs) => tabs[pickedTabIndex],
    orElse: () => null,
  );
});
