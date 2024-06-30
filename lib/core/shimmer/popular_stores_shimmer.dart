import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class PopularStoresShimmer extends StatelessWidget {
  const PopularStoresShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) {
            return ShimmerEffect(
              widget: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                   color: AppColors.offWhiteColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
