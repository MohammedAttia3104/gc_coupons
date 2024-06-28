import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/core/widgets/quick_share_button.dart';

class TrendingCouponQuickShare extends StatelessWidget {
  const TrendingCouponQuickShare({
    super.key,
    required this.index,
    required this.model,
  });

  final int index;
  final CouponModel model;

  @override
  Widget build(BuildContext context) {
    return QuickShareButton(
      index: index,
      couponModel: model,
    );
  }
}
