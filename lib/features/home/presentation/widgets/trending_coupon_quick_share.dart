import 'package:flutter/material.dart';
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
