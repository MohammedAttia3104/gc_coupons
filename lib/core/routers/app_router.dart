import 'package:flutter/material.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/slide_up_transition.dart';
import 'package:gc_coupons/features/categories/presentation/category_screen.dart';
import 'package:gc_coupons/features/home/presentation/home_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.allCategories:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.allCategories),
          builder: (_) => const SlideUpTransition(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 1000 * 2),
            child: CategoryScreen(),
          ),
        );
      // case '/showCoupon':
      //   return MaterialPageRoute(builder: (_) => ShowCouponButton());
      default:
        return null;
    }
  }
}

// settings: RouteSettings(name: Routes.homeScreen),
