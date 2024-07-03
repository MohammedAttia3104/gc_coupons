import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(14.h),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        mainAxisExtent: 110.r,
      ),
      itemBuilder: (context, index) {
        return  SizedBox(
          height: 125.h,
          width: 100.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ShimmerEffect(
                widget: Container(
                  height: 75.h,
                  width: 75.w,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 15.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    ShimmerEffect(
                      widget: Container(
                        width: 100.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.kGreyColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 18,
    )
    ;
  }
}
