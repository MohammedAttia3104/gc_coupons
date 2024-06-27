import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';
import 'package:gc_coupons/features/home/presentation/widgets/quick_share_button.dart';

class TrendingCouponItemBody extends StatelessWidget {
  const TrendingCouponItemBody({
    super.key,
    required this.model,
  });

  final TrendingCouponsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomFancyShimmerImage(
          imageUrl: model.imageUrl,
          onTap: () {},
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
                  SectionRoundedButton(
                    title: AppStrings.exclusive,
                    backgroundColor: AppColors.greenBtnColor,
                    titleColor: AppColors.kWhiteColor,
                    borderRadius: 10.0.r,
                    onTap: () {},
                  ),
                  const Spacer(),
                  const QuickShareButton(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}