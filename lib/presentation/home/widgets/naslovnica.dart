import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/home/widgets/home_events.dart';
import 'package:misli_os_app/presentation/home/widgets/home_picture.dart';
import 'package:misli_os_app/presentation/home/widgets/home_stats.dart';

class Naslovnica extends StatelessWidget {
  const Naslovnica({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePicture(),
        HomeStats(),
        Divider(
          color: AppColors.secondary,
          thickness: 0.5,
          height: 1,
        ),
        HomeEvents(),
      ],
    );
  }
}
