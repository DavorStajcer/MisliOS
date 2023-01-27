import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/event_model.dart';
import 'package:misli_os_app/presentation/home/widgets/event_text.dart';

class EventSmall extends StatelessWidget {
  final EventModel eventModel;
  const EventSmall({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          width: double.infinity,
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
        const SizedBox(
          width: 50,
        ),
        Column(
          children: [
            SizedBox(
              child: EventText(
                eventModel: eventModel,
              ),
            ),
          ],
        )
      ],
    );
  }
}