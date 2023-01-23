import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/domain/models/home_tab_custom.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_picked_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/custom_content.dart';
import 'package:misli_os_app/presentation/home/widgets/naslovnica.dart';

class PageContent extends ConsumerWidget {
  const PageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTab = ref.watch(tabPickedProvider);

    if (homeTab == null) {
      return const SizedBox();
    }
    return homeTab is HomeTabCustom
        ? CustomContent(homeTab.body)
        : const Naslovnica();
  }
}
