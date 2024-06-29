import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';


class CouponCodeStyleWidget extends StatelessWidget {
  final String code;

  const CouponCodeStyleWidget({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
      ),
      child: Center(
        child: Text(
          code,
          style: TextStyle(
            color: AppColors.kBlackColor,
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
