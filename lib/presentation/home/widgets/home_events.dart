import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/events_provider/events_provider.dart';
import 'package:misli_os_app/presentation/common/text_styles.dart';
import 'package:misli_os_app/presentation/home/widgets/event.dart';

class HomeEvents extends ConsumerWidget {
  const HomeEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsState = ref.read(eventsNotifierProvider);
    return eventsState.maybeWhen(
      data: ((eventBodies) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: Column(
              children: [
                for (int i = 0; i < eventBodies.length; i++)
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Event(
                        eventModel: eventBodies[i],
                      ),
                      if (i < eventBodies.length - 1)
                        const SizedBox(
                          height: 40,
                        ),
                      if (i < eventBodies.length - 1)
                        DottedLine(
                          lineThickness: 1,
                          dashLength: 4,
                          dashColor: Colors.blue.withOpacity(0.4),
                        ),
                      if (i == eventBodies.length - 1)
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                const DottedLine(
                                  dashGapColor: Colors.blue,
                                  dashColor: Colors.blue,
                                  lineThickness: 1,
                                ),
                                SizedBox(
                                  height: 0.5,
                                ),
                                DottedLine(
                                  lineThickness: 1,
                                  dashLength: 4,
                                  dashColor: Colors.blue.withOpacity(0.4),
                                ),
                                SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Prikaži sve projekte',
                                    style: TextStyles.normal
                                        .copyWith(color: Colors.blue),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                    ],
                  )
              ],
            ),
          )),
      orElse: () => const SizedBox(),
    );
  }
}
