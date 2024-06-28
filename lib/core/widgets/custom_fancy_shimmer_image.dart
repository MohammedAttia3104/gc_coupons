import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';

class CustomFancyShimmerImage extends StatelessWidget {
  final String imageUrl;
  final Function()? onTap;

  const CustomFancyShimmerImage({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FancyShimmerImage(
        imageUrl: imageUrl,
        errorWidget: const Icon(Icons.error),
        width: 100.w,
        height: 100.h,
        shimmerBaseColor: AppColors.kGreyColor,
        shimmerHighlightColor: AppColors.kWhiteColor,
        shimmerBackColor: AppColors.kGreyColor,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGreyColor.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          );
        },
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kGreyColor.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
