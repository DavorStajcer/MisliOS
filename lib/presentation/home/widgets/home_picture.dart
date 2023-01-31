import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/main_image_provider/main_image_provider.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';

class HomePicture extends ConsumerWidget {
  const HomePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainImageState = ref.watch(mainImageProvider);
    final windowSizeState = ref.watch(windowSizeProvider);
    log('windowsizestuff: $windowSizeState');
    return mainImageState.maybeWhen(
      data: (imageUrl) => SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrl,
                height: windowSizeState.maybeWhen(
                  small: (_) => 250,
                  orElse: () => 400,
                ),
                fit: windowSizeState.maybeWhen(
                  small: (_) => BoxFit.fitHeight,
                  orElse: () => BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              color: AppColors.primary.withOpacity(0.1),
            )
          ],
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
