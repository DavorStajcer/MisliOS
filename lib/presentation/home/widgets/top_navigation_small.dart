import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/app_images.dart';
import 'package:misli_os_app/presentation/home/widgets/logo.dart';

class TopNavigationSmall extends StatelessWidget {
  const TopNavigationSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 20),
        Logo(),
        Expanded(child: SizedBox()),
        Icon(Icons.menu),
        SizedBox(width: 20),
      ],
    );
  }
}
