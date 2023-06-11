import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_proyect/pages/account_page/account_page.dart';
import 'package:task_proyect/pages/basket_page/basket_page.dart';
import 'package:task_proyect/pages/search_page/search_page.dart';
import '../pages/category_page/category_page.dart';
import '../pages/main_page/main_page.dart';
import '../pages/home_page/home_page.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider =
// Provider<GoRouter>((ref) {
//   return
    GoRouter(
        navigatorKey: _rootNavigator,
        initialLocation: AppRoute.root.path,
        routes: [
      GoRoute(
          path: AppRoute.main.path,
          name: AppRoute.root.name,
          builder: (context, state) => MainPage(
                key: state.pageKey,
              )),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) => HomePage(
                key: state.pageKey,
                child: child,
              ),
          routes: [
            GoRoute(
              path: AppRoute.root.path,
              name: AppRoute.main.name,
              parentNavigatorKey: _shellNavigator,
              pageBuilder: (context, state) => NoTransitionPage(
                child: MainPage(
                  key: state.pageKey,
                ),
              ),
            ),
            GoRoute(
              path: AppRoute.search.path,
              name: AppRoute.search.name,
              parentNavigatorKey: _shellNavigator,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: SearchPage(
                key: state.pageKey,
              )),
              // routes: [

              // ],
            ),
            GoRoute(
              path: AppRoute.basket.path,
              name: AppRoute.basket.name,
              parentNavigatorKey: _shellNavigator,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: BasketPage(
                key: state.pageKey,
              )),
            ),
            GoRoute(
              path: AppRoute.account.path,
              name: AppRoute.account.name,
              parentNavigatorKey: _shellNavigator,
              pageBuilder: (context, state) => NoTransitionPage(
                child: AccountPage(
                  key: state.pageKey,
                ),
              ),
            ),
            GoRoute(
              path: AppRoute.detail.path,
              name: AppRoute.detail.name,
              parentNavigatorKey: _shellNavigator,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CategoryPage(
                    key: state.pageKey, text: state.queryParameters['id1']),
              ),
            ),
          ]),
    ]);
// });
