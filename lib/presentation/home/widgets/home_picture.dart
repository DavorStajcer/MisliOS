import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/main_image_provider/main_image_provider.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';

class HomePicture extends ConsumerWidget {
  const HomePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainImageState = ref.watch(mainImageProvider);
    final windowSizeState = ref.watch(windowSizeProvider);
    log('windowsizestuff: $windowSizeState');
    return mainImageState.maybeWhen(
      data: (imageUrl) => SizedBox(
        height: 400,
        width: double.infinity,
        child: Image.network(
          imageUrl,
          fit: windowSizeState.maybeWhen(
            small: (_) => BoxFit.fitHeight,
            orElse: () => BoxFit.fitWidth,
          ),
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
