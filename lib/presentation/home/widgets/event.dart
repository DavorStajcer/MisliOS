import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/home/widgets/event_text.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 350,
          width: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            image: DecorationImage(
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/2/21/Trg_sv._Trojstva_Osijek.jpg',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        const Expanded(
          child: SizedBox(
            height: 350,
            child: EventText(),
          ),
        )
      ],
    );
  }
}
