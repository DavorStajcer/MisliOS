import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/home/widgets/event_full.dart';
import 'package:misli_os_app/presentation/home/widgets/event_small.dart';

class Event extends ConsumerWidget {
  final EventModel eventModel;
  const Event({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSizeState = ref.watch(windowSizeProvider);
    return windowSizeState.when(
      full: (Size size) => EventFull(
        eventModel: eventModel,
      ),
      medium: (Size size) => EventFull(
        eventModel: eventModel,
      ),
      small: (Size size) => EventSmall(
        eventModel: eventModel,
      ),
      undefined: () => const SizedBox(),
    );
  }
}
