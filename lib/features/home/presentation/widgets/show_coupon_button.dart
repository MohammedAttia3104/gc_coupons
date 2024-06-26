import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class ShowCouponButton extends StatelessWidget {
  const ShowCouponButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionRoundedButton(
      title: AppStrings.showCoupon,
      backgroundColor: AppColors.showDealBtnColor,
      borderRadius: 10.0.r,
      buttonWidth: MediaQuery.sizeOf(context).width,
      titleColor: AppColors.kWhiteColor,
      onTap: () {},
    );
  }
}
