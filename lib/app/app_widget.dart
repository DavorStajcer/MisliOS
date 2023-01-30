import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/presentation/home/widgets/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/tabs/0',
    ),
    GoRoute(
      path: '/tabs/:tabId',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: HomeScreen(
            key: state.pageKey,
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
            key: state.pageKey,
            eventId: eventId,
          ),
        );
      },
      /*        pageBuilder: (context, state) {
            final String eventId = state.params['eventId'] ?? '';
            return NoTransitionPage(child: );
          }, */
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
