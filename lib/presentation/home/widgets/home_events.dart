import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/event.dart';
import 'package:misli_os_app/presentation/home/widgets/show_more_events.dart';

class HomeEvents extends ConsumerWidget {
  const HomeEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsState = ref.read(eventsNotifierProvider);
    return eventsState.maybeWhen(
      data: ((eventBodies) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Event(
                  eventModel: eventBodies[0],
                ),
                const SizedBox(
                  height: 30,
                ),
                if (eventBodies.length > 1)
                  DottedLine(
                    lineThickness: 1,
                    dashLength: 4,
                    dashColor: Colors.blue.withOpacity(0.4),
                  ),
                if (eventBodies.length > 1)
                  const SizedBox(
                    height: 30,
                  ),
                if (eventBodies.length > 1)
                  Event(
                    eventModel: eventBodies[1],
                  ),
                if (eventBodies.length > 1)
                  const SizedBox(
                    height: 30,
                  ),
                if (eventBodies.length > 2) ShowMoreEvents(eventBodies),
              ],
            ),
          )),
      orElse: () => const SizedBox(),
    );
  }
}
