import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/home/widgets/event.dart';

class HomeEvents extends StatelessWidget {
  const HomeEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            Column(
              children: const [
                SizedBox(
                  height: 50,
                ),
                Event(),
              ],
            )
        ],
      ),
    );
  }
}
