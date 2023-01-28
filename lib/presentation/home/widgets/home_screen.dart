import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/home/pages/home_page.dart';
import 'package:misli_os_app/presentation/home/widgets/home_drawer.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;
  const HomeScreen(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widnowSizeState = ref.watch(windowSizeProvider);
    return Scaffold(
      drawer: widnowSizeState.whenOrNull(
        small: (_) => const HomeDrawer(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = Size(constraints.maxWidth, constraints.maxHeight);
          Future.delayed(const Duration(seconds: 1), () {
            ref
                .read(windowSizeProvider.notifier)
                .onWidnowSizeChanged(screenSize);
          });
          return HomePage(child);
        },
      ),
    );
  }
}
