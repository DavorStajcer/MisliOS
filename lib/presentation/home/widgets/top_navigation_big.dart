import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/logo.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_item.dart';

class TopNavigationBig extends ConsumerWidget {
  const TopNavigationBig({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsState = ref.read(tabsNotifierProbider);
    return tabsState.maybeWhen(
      data: (tabs) => Row(
        children: [
          const Expanded(
            flex: 2,
            child: Logo(),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < tabs.length; i++)
                  Tabitem(
                    homeTab: tabs[i],
                    tabIndex: i,
                  ),
              ],
            ),
          ),
        ],
      ),
      orElse: () => const SizedBox(),
    );
  }
}
