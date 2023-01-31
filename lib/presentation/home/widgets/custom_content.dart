import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/widgets/custom_content_full.dart';
import 'package:misli_os_app/presentation/home/widgets/custom_content_medium.dart';
import 'package:misli_os_app/presentation/home/widgets/custom_content_small.dart';

class CustomContent extends ConsumerWidget {
  final String body;
  const CustomContent(
    this.body, {
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowSizeState = ref.watch(windowSizeProvider);
    log('windowSizeState $windowSizeState');
    return windowSizeState.when(
      full: (Size size) => CustomContentFull(body),
      medium: (Size size) => CustomContentMedium(body),
      small: (Size size) => CustomContentSmall(body),
      undefined: () => const SizedBox(),
    );
  }
}
