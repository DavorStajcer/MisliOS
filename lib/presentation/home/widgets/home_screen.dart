import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/domain/interactors/window_size_provider/window_size_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/home/pages/home_page.dart';
import 'package:misli_os_app/presentation/home/widgets/home_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String? eventId;
  const HomeScreen({
    Key? key,
    this.eventId,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomState();
}

class _HomState extends ConsumerState<HomeScreen> {
  bool hasDrawer = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      windowSizeProvider,
      (beofre, next) => next.maybeWhen(
        small: (_) => !hasDrawer
            ? setState(() {
                hasDrawer = true;
              })
            : null,
        orElse: () => hasDrawer
            ? setState(() {
                hasDrawer = false;
              })
            : null,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      drawer: hasDrawer ? const HomeDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = Size(constraints.maxWidth, constraints.maxHeight);

          Future.delayed(const Duration(seconds: 1), () {
            ref
                .read(windowSizeProvider.notifier)
                .onWidnowSizeChanged(screenSize);
          });
          return HomePage(widget.eventId);
        },
      ),
    );
  }
}
