import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/features/home/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:gc_coupons/features/home/presentation/home_view.dart';
import 'package:gc_coupons/features/store/presentation/all_stores_screen.dart';
import 'package:gc_coupons/features/store/presentation/store_screen.dart';
import '../../../favourites/presentation/favourites_screen.dart';

class HomePageViewBuilder extends StatelessWidget {
  const HomePageViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: BlocProvider.of<BottomNavBarCubit>(context).controller,
          children: const [
            HomeView(),
            AllStoresScreen(),
            FavouritesScreen(),
          ],
        );
      },
    );
  }
}
