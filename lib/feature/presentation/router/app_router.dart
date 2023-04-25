import 'package:auto_route/auto_route.dart';
import '../pages/page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: '/',
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'login',
              page: LoginRoute.page,
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'RootRoute')
class RootPage extends AutoRouter {
  const RootPage({super.key});
}
