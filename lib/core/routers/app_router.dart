import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
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
          builder: (_) => BlocProvider<CategoryCubit>(
            create: (_) => sl<CategoryCubit>()..getCategories(),
            child: const CategoryScreen(),
          ),
        );
      // case '/showCoupon':
      //   return MaterialPageRoute(builder: (_) => ShowCouponButton());
      default:
        return null;
    }
  }
}
