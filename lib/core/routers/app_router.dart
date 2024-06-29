import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/core/widgets/slide_up_transition.dart';
import 'package:gc_coupons/features/categories/presentation/category_screen.dart';
import 'package:gc_coupons/features/home/presentation/home_screen.dart';
import 'package:gc_coupons/features/search/presentation/search_screen.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';
import 'package:gc_coupons/features/store/presentation/store_screen.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final Object? arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) {
          return const HomeScreen();
        });
      case Routes.allCategories:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.allCategories),
          builder: (_) => const SlideUpTransition(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 1000 * 2),
            child: CategoryScreen(),
          ),
        );
      case Routes.storeData:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.storeData),
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<StoreCubit>(
                  create: (_) => sl<StoreCubit>()
                    ..getStoreData(int.parse(settings.arguments as String)),
                ),
                BlocProvider<StoreCouponsCubit>(
                  create: (_) => sl<StoreCouponsCubit>()
                    ..getStoreCoupons(int.parse(settings.arguments as String)),
                ),
              ],
              child: const SlideUpTransition(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 1000 * 2),
                child: StoreScreen(),
              ),
            );
          },
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.searchScreen),
          builder: (_) {
            return const SlideUpTransition(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 1000 * 2),
              child: SearchScreen(),
            );
          },
        );
      default:
        return null;
    }
  }
}

// settings: RouteSettings(name: Routes.homeScreen),
