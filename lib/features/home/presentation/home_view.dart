import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/presentation/widgets/grid_item.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_grid_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_stores_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ],
        ),
      ),
    );
  }
}
