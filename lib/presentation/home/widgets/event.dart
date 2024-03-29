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
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.ternary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.65)),
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
