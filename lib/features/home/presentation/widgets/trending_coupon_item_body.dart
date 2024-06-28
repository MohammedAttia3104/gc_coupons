import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/home/presentation/widgets/trending_coupon_quick_share.dart';

class TrendingCouponItemBody extends StatelessWidget {
  final int index;

  const TrendingCouponItemBody({
    super.key,
    required this.model,
    required this.index,
  });

  final CouponModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomFancyShimmerImage(
          imageUrl: model.imageUrl,
          onTap: () {
            return Navigator.pushNamed(
              context,
              Routes.storeData,
              arguments: model.storeId,
            );
          },
        ),
        SizedBox(
          width: AppPadding.padding14w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 2,
                style: AppStyles.style14Bold.copyWith(
                  color: AppColors.kBlackColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: AppPadding.padding14h,
              ),
              Row(
                children: [
                  model.exclusive == '0'
                      ? const SizedBox.shrink()
                      : SectionRoundedButton(
                          title: AppStrings.exclusive,
                          backgroundColor: AppColors.greenBtnColor,
                          titleColor: AppColors.kWhiteColor,
                          borderRadius: 10.0.r,
                          onTap: () {},
                        ),
                  const Spacer(),
                  TrendingCouponQuickShare(
                    index: index,
                    model: model,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
