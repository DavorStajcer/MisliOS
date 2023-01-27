import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/app_images.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.misliOs,
          style: AppTextStyles.tabText.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(AppImages.misliOsLogoBluePath),
        ),
      ],
    );
  }
}
