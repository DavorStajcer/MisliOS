import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/event_provider/event_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/custom_content.dart';
import 'package:misli_os_app/presentation/home/widgets/home_page_reload.dart';

class EventContent extends ConsumerWidget {
  final String eventId;
  const EventContent(this.eventId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(eventNotifierProvider(eventId));
    return eventState.when(
      failure: (errorMessage) => HomePageReload(errorMessage),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (event) => CustomContent(event.body),
    );
  }
}
