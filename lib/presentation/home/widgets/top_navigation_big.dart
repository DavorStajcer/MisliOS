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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 50,
          ),
          const Logo(),
          const Expanded(child: SizedBox()),
          for (int i = 0; i < tabs.length; i++)
            Tabitem(
              homeTab: tabs[i],
              tabIndex: i,
            ),
          const SizedBox(
            width: 50,
          )
        ],
      ),
      orElse: () => const SizedBox(),
    );
  }
}
