// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePageView());
    },
    AwardsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AwardsPageView());
    },
    HabitPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HabitPageView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/'),
        RouteConfig(AwardsPageRoute.name, path: '/awards-page-view'),
        RouteConfig(HabitPageRoute.name, path: '/habit-page-view')
      ];
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [AwardsPageView]
class AwardsPageRoute extends PageRouteInfo<void> {
  const AwardsPageRoute()
      : super(AwardsPageRoute.name, path: '/awards-page-view');

  static const String name = 'AwardsPageRoute';
}

/// generated route for
/// [HabitPageView]
class HabitPageRoute extends PageRouteInfo<void> {
  const HabitPageRoute() : super(HabitPageRoute.name, path: '/habit-page-view');

  static const String name = 'HabitPageRoute';
}
