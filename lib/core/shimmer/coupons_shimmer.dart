import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';
import 'empty_image_shimmer.dart';

class CouponsShimmer extends StatelessWidget {
  const CouponsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ShimmerEffect(
              widget: Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.offWhiteColor,
                  border: Border.all(
                    color: AppColors.kGreyColor.withOpacity(0.6),
                    width: 0.4,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppPadding.padding8h,
            ),
            ShimmerEffect(
              widget: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.kGreyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: AppPadding.padding8h);
      },
      itemCount: 6,
    );
  }
}
