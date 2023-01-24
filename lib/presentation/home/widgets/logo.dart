import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/app_images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'MisliOS',
          style: TextStyle(fontSize: 22),
        ),
        Image.asset(AppImages.misliOsLogoPath),
      ],
    );
  }
}
