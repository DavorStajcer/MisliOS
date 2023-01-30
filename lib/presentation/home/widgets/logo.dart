import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/domain/providers/tab_picked_provider/tab_index_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_images.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class Logo extends ConsumerWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(tabIndexProvider.notifier).state = 0;
            GoRouter.of(context).go('/tabs/0');
          },
          child: Text(
            AppStrings.misliOs,
            style: AppTextStyles.tabText.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              ref.read(tabIndexProvider.notifier).state = 0;
              GoRouter.of(context).go('/tabs/0');
            },
            child: Image.asset(AppImages.misliOsLogoBluePath),
          ),
        ),
      ],
    );
  }
}
