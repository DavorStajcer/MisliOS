import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_item_small.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsState = ref.read(tabsNotifierProbider);
    return tabsState.maybeWhen(
      data: (tabs) => Drawer(
        backgroundColor: AppColors.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: const SizedBox(),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            for (var i = 0; i < tabs.length; i++)
              TabitemSmall(homeTab: tabs[i], tabIndex: i),
          ],
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
