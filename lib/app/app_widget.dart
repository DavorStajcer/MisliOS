import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/presentation/common/widgets/navigation_error_page.dart';
import 'package:misli_os_app/presentation/home/widgets/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  errorBuilder: (context, state) {
    log('erorr navigating ${state.error}');
    return const NavigationErrorPage();
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/tabs/0',
    ),
    GoRoute(
      path: '/tabs/:tabId',
      pageBuilder: (context, state) {
        final String tabId = state.params['tabId'] ?? '';
        log('tabnavigationstuff: pageBuilder, tabId $tabId');
        return NoTransitionPage(
          child: HomeScreen(
            key: Key(tabId),
            tabId: int.tryParse(tabId),
          ),
        );
      },
    ),
    GoRoute(
      path: '/event/:eventId',
      pageBuilder: (context, state) {
        final String eventId = state.params['eventId'] ?? '';
        return NoTransitionPage(
          child: HomeScreen(
            key: Key(eventId),
            eventId: eventId,
          ),
        );
      },
    )
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
