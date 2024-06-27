import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/functions/navigate_to_launched_url.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/copy_coupon_code_widget.dart';

import '../../../../core/widgets/html_content.dart';

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
