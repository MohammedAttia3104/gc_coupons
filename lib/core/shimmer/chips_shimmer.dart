import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class ChipsShimmer extends StatelessWidget {
  const ChipsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ShimmerEffect(
            widget: Container(
              width: 100.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.kGreyColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 5.w,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
