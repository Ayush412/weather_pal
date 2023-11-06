import 'package:auto_route/auto_route.dart';
import 'package:weather/core/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: ForecastRoute.page, path: '/'),
  ];
}
