import 'package:flutter/material.dart';

class MyNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Extract route information from the Route object
    String? routeName = _extractRouteName(route);
    debugPrint('Pushed route: $routeName');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String? routeName = _extractRouteName(route);
    debugPrint('Popped route: $routeName');
    super.didPop(route, previousRoute);
  }

  // Helper method to extract route name (if available)
  String? _extractRouteName(Route<dynamic> route) {
    if (route is PageRoute && route.settings.name != null) {
      return route.settings.name;
    }
    return null; // Unable to extract route name
  }
}