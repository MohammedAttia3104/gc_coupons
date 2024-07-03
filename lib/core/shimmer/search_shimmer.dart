import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              color: AppColors.appBarColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 50.h,
                bottom: 10.h,
              ),
              child: Material(
                color: AppColors.offWhiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.offWhiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.kGreyColor,
                        size: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        AppStrings.search,
                        style: AppStyles.style14Bold.copyWith(
                          color: AppColors.kGreyColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.close,
                        size: 24.r,
                        color: AppColors.kGreyColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),
            itemBuilder: (context, index) {
              return ShimmerEffect(
                widget: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0.h,
                  decoration: BoxDecoration(
                    color: AppColors.offWhiteColor,
                    borderRadius: BorderRadius.circular(25).r,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10.h);
            },
          ),
        ),
      ],
    );
  }
}
