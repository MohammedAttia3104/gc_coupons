import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/shimmer/coupons_shimmer.dart';
import 'package:gc_coupons/core/shimmer/empty_image_shimmer.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';
import 'package:gc_coupons/generated/assets.dart';

class StoreShimmer extends StatelessWidget {
  const StoreShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.only(top: 35.h),
              width: MediaQuery.sizeOf(context).width,
              //height: 35.h,
              decoration: const BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_sharp),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.kBlackColor,
                      size: 24.r,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.assetsIconsShareNodesSolid,
                      fit: BoxFit.contain,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              const EmptyImageShimmer(),
              SizedBox(
                height: 15.h,
              ),
              ShimmerEffect(
                widget: Container(
                  height: 120.h,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.kGreyColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShimmerEffect(
                          widget: SizedBox(
                            width: 100.w,
                            height: 20.h,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ShimmerEffect(
                            widget: Container(
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
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    const CouponsShimmer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
