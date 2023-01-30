import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_container.dart';
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
    return GestureDetector(
      onTap: () {
        ref.read(tabIndexProvider.notifier).state = null;
        GoRouter.of(context).go('/event/${eventModel.id}');
      },
      child: HoverContainer(
        hoveredDecoration: BoxDecoration(
          color: AppColors.eventBackground.withOpacity(0.85),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        decoration:
            BoxDecoration(color: AppColors.eventBackground.withOpacity(0.65)),
        child: windowSizeState.when(
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
        ),
      ),
    );
  }
}
