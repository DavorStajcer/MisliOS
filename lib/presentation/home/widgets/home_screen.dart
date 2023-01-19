import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/pages/home_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = Size(constraints.maxWidth, constraints.maxHeight);
          Future.delayed(const Duration(seconds: 1), () {
            ref
                .read(windowSizeProvider.notifier)
                .onWidnowSizeChanged(screenSize);
          });
          return const HomePage();
        },
      ), /* windowSize.when(
          full: (_) => const HomePageFull(),
          medium: (_) => const HomePageFull(),
          small: (_) => const HomePageFull(),), */
    );
  }
}
