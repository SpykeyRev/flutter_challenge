import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/base/routing/ui/not_found_screen.dart';
import 'package:flutter_challenge/src/results_page/ui/model/results_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../home_page/ui/pages/home_page.dart';
import '../../results_page/ui/pages/results_page.dart';

///AppRoute exposes the available routes
enum AppRoute {
  home('/home'),
  resultsPage('resultsPage'),
  notFoundScreen('/404');

  const AppRoute(this.path);

  final String path;
}

///General navigator Key
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

///App router
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoute.home.path,
      debugLogDiagnostics: true,
      //In case of navigation exception (Wrong path or location name)
      onException: (_, GoRouterState state, GoRouter router) {
        debugPrint("state.error = ${state.error}");
        router.pushNamed(AppRoute.notFoundScreen.name);
      },
      routes: <RouteBase>[
        // Main route
        GoRoute(
          path: AppRoute.home.path,
          name: AppRoute.home.name,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
          routes: [
            //Route for results page
            GoRoute(
              path: AppRoute.resultsPage.path,
              name: AppRoute.resultsPage.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                //Use query parameters for making it web friendly
                //If no breed is selected we redirect to the NotFoundScreen
                if (!state.uri.queryParameters.containsKey('breed')) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: const NotFoundScreen(),
                  );
                }
                return MaterialPage(
                  key: state.pageKey,
                  child: ResultsPage(
                    model: ResultsPageModel.fromJson(
                      state.uri.queryParameters,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        // Generic error route
        GoRoute(
          path: AppRoute.notFoundScreen.path,
          name: AppRoute.notFoundScreen.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
              key: state.pageKey,
              child: const NotFoundScreen(),
            );
          },
        ),
      ],
    );
  },
);
