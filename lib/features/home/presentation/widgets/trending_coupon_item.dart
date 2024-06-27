import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';
import 'package:gc_coupons/features/home/presentation/widgets/show_coupon_button.dart';
import 'package:gc_coupons/features/home/presentation/widgets/trending_coupon_item_body.dart';

class TrendingCouponItem extends StatelessWidget {
  final TrendingCouponsModel model;

  const TrendingCouponItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.showCouponDialog,
              arguments: model,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.offWhiteColor,
              border: Border.all(
                color: AppColors.kGreyColor.withOpacity(0.6),
                width: 0.4,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGreyColor.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TrendingCouponItemBody(model: model),
          ),
        ),
        SizedBox(
          height: AppPadding.padding8h,
        ),
        const ShowCouponButton(),
      ],
    );
  }
}
