import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/home/widgets/event_text.dart';

class EventFull extends ConsumerWidget {
  final EventModel eventModel;
  const EventFull({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            image: DecorationImage(
              image: NetworkImage(
                eventModel.previewImageUrl,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: SizedBox(
            height: 350,
            child: EventText(
              eventModel: eventModel,
            ),
          ),
        )
      ],
    );
  }
}
