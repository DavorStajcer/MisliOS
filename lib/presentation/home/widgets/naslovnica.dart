import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/home/widgets/home_events.dart';
import 'package:misli_os_app/presentation/home/widgets/home_picture.dart';
import 'package:misli_os_app/presentation/home/widgets/home_stats.dart';

class Naslovnica extends StatelessWidget {
  const Naslovnica({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HomePicture(),
        HomeStats(),
        HomeEvents(),
      ],
    );
  }
}
