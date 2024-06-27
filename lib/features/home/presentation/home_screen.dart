import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/networks/network_connection_cubit/internet_connection_cubit.dart';
import 'package:gc_coupons/core/networks/no_inetrnet_connection_screen.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/home/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/home_screen_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
      listener: (context, state) {
        if (state is InternetConnectionDisconnected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NoInternetConnectionScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is InternetConnectionConnected) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavBarCubit>(
                create: (_) => BottomNavBarCubit(),
              ),
              BlocProvider<PopularStoresCubit>(
                create: (_) => sl<PopularStoresCubit>()..getPopularStores(),
              ),
              BlocProvider<TrendingCouponsCubit>(
                create: (_) => sl<TrendingCouponsCubit>()..getTrendingCoupons(),
              ),
            ],
            child: const HomeScreenPageView(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
