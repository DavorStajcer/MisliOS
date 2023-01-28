import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/home/widgets/event_text.dart';

class EventFull extends StatelessWidget {
  final EventModel eventModel;
  const EventFull({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/event/${eventModel.id}'),
          child: Container(
            height: 350,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              image: DecorationImage(
                image: NetworkImage(
                  eventModel.imageUrl,
                ),
                fit: BoxFit.fitHeight,
              ),
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
