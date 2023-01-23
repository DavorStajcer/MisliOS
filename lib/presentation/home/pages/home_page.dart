import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/home_page_loading_provider/home_page_loading_provider.dart';
import 'package:misli_os_app/domain/providers/page_scroll_controller_provider/page_scroll_conroller_probider.dart';
import 'package:misli_os_app/presentation/home/widgets/home_page_reload.dart';
import 'package:misli_os_app/presentation/home/widgets/page_content.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageLoadingState = ref.watch(homePageLoadingProvider);
    log('home page builder, homePageLoadingState $homePageLoadingState');
    return SingleChildScrollView(
      controller: ref.read(pageScrollControllerProvider),
      child: homePageLoadingState.when(
        failure: (String message) => HomePageReload(message),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        allDataFetched: () => Column(
          children: const [
            TopNavigation(),
            PageContent(),
          ],
        ),
      ),
    );
  }
}
