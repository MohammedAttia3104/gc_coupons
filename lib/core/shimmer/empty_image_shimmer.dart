import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class EmptyImageShimmer extends StatelessWidget {
  const EmptyImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      widget: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.kGreyColor,
        ),
      ),
    );
  }
}