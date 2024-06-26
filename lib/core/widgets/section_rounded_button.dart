import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

class SectionRoundedButton extends StatelessWidget {
  final Widget? icon;
  final String title;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? borderRadius;
  final double? titleSize;
  final double? buttonWidth;

  const SectionRoundedButton({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.titleColor,
    this.titleSize,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kGreyColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: titleColor ?? AppColors.kBlackColor,
                fontSize: titleSize ?? AppFonts.fontSize14,
                fontWeight: FontWeight.w700,
              ),
            ),
            icon != null ? SizedBox(width: 5.w) : const SizedBox.shrink(),
            icon != null
                ? const Icon(Icons.search, color: AppColors.kBlackColor)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
