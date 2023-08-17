import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter({required this.counterCubit});
  CounterCubit counterCubit;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: 'map',
              page: MapTab.page,
              initial: true,
              children: [
                AutoRoute(path: "", page: MapRoute.page),
                AutoRoute(path: "detail", page: DetailRoute.page),
              ],
            ),
            AutoRoute(
              path: 'scan',
              page: ScanTab.page,
              children: [
                AutoRoute(
                  path: "",
                  page: ScanRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(path: 'profile', page: ProfileTab.page, children: [
              AutoRoute(path: "", page: ProfileRoute.page),
            ]),
          ],
        ),
        AutoRoute(path: '/login', page: LoginRoute.page, keepHistory: false),
      ];
}
