import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/features/home/presentation/widgets/trending_coupons_list_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_grid_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_stores_bar.dart';
import 'package:gc_coupons/features/home/presentation/widgets/trending_bar.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.padding14w),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: AppPadding.padding14h,
              ),
              const PopularStoresBar(),
              SizedBox(
                height: AppPadding.padding14h,
              ),
              const PopularGridView(),
              SizedBox(
                height: AppPadding.padding30h,
              ),
              const TrendingBar(),
              SizedBox(
                height: AppPadding.padding14h,
              ),
              const TrendingCouponsListView(),
              SizedBox(
                height: AppPadding.padding14h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
