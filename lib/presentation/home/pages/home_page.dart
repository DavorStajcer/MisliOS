import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/providers/home_page_loading_provider/home_page_loading_provider.dart';
import 'package:misli_os_app/domain/providers/page_scroll_controller_provider/page_scroll_conroller_probider.dart';
import 'package:misli_os_app/presentation/home/widgets/event_content.dart';
import 'package:misli_os_app/presentation/home/widgets/footer.dart';
import 'package:misli_os_app/presentation/home/widgets/home_page_reload.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_content.dart';
import 'package:misli_os_app/presentation/home/widgets/top_navigation.dart';

class HomePage extends ConsumerWidget {
  final String? eventId;
  const HomePage(
    this.eventId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageLoadingState = ref.watch(homePageLoadingProvider);
    return homePageLoadingState.when(
      failure: (String message) => HomePageReload(message),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      allDataFetched: () => SingleChildScrollView(
        controller: ref.read(pageScrollControllerProvider),
        child: homePageLoadingState.when(
          failure: (String message) => HomePageReload(message),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          allDataFetched: () => Column(
            children: [
              Column(
                children: [
                  const TopNavigation(),
                  Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 250),
                    child: eventId != null
                        ? EventContent(eventId!)
                        : const TabContent(),
                  ),
                  const Footer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
