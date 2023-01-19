import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/app_images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'MisliOS',
          style: TextStyle(fontSize: 22),
        ),
        Image.asset(AppImages.misliOsLogoPath),
      ],
    );
  }
}
