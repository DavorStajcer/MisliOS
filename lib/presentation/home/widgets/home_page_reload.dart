import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';

class HomePageReload extends ConsumerWidget {
  final String errorMessage;
  const HomePageReload(
    this.errorMessage, {
    super.key,
  });

  _reloadHomePageData(WidgetRef ref) async {
    await ref.read(statsNotifierProvider.notifier).reloadHomePage();
    await ref.read(tabsNotifierProbider.notifier).reloadHomePage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => _reloadHomePageData(ref),
          child: const Text(AppStrings.reloadPage),
        ),
      ],
    );
  }
}
