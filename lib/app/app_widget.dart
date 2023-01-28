import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/presentation/home/widgets/event_content.dart';
import 'package:misli_os_app/presentation/home/widgets/home_screen.dart';
import 'package:misli_os_app/presentation/home/widgets/tab_content.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => HomeScreen(child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const TabContent(),
        ),
        GoRoute(
          path: '/event/:eventId',
          builder: (context, state) {
            final String eventId = state.params['eventId'] ?? '';
            return EventContent(eventId);
          },
        )
      ],
    ),
  ],
);

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
