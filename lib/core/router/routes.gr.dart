// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:weather/features/forecast/presentation/pages/forecast_page.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ForecastRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForecastPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.ForecastPage]
class ForecastRoute extends _i2.PageRouteInfo<void> {
  const ForecastRoute({List<_i2.PageRouteInfo>? children})
      : super(
          ForecastRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForecastRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
