import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/shimmer/shimmer_effect.dart';

class AllStoresItemShimmer extends StatelessWidget {
  const AllStoresItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 25,
            child: ShimmerEffect(
              widget: Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
          ShimmerEffect(
            widget: Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
