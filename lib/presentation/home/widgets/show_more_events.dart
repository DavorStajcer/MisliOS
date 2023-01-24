import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/domain/providers/show_more_events_provider/show_more_events_provider.dart';
import 'package:misli_os_app/presentation/common/values/text_styles.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_text.dart';
import 'package:misli_os_app/presentation/home/widgets/event.dart';

class ShowMoreEvents extends ConsumerWidget {
  final List<EventModel> eventBodies;
  const ShowMoreEvents(
    this.eventBodies, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool shouldShow = ref.watch(showMoreEventsProvider);
    return shouldShow
        ? Column(
            children: [
              DottedLine(
                lineThickness: 1,
                dashLength: 4,
                dashColor: Colors.blue.withOpacity(0.4),
              ),
              for (int i = 2; i < eventBodies.length; i++)
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Event(
                      eventModel: eventBodies[i],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    if (i < eventBodies.length - 1)
                      DottedLine(
                        lineThickness: 1,
                        dashLength: 4,
                        dashColor: Colors.blue.withOpacity(0.4),
                      ),
                  ],
                )
            ],
          )
        : Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const DottedLine(
                    dashGapColor: Colors.blue,
                    dashColor: Colors.blue,
                    lineThickness: 1,
                  ),
                  const SizedBox(
                    height: 0.5,
                  ),
                  DottedLine(
                    lineThickness: 1,
                    dashLength: 4,
                    dashColor: Colors.blue.withOpacity(0.4),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () => ref
                          .read(showMoreEventsProvider.notifier)
                          .state = true,
                      child: HoverText(
                        'Prikaži sve projekte',
                        style: TextStyles.normal.copyWith(color: Colors.blue),
                        hoveredStyle:
                            TextStyles.normal.copyWith(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
  }
}
