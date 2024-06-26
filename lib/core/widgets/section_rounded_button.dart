import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

class SectionRoundedButton extends StatelessWidget {
  final Widget? icon;
  final Widget? customWidget;
  final String title;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? borderRadius;
  final double? titleSize;
  final double? buttonWidth;
  final double? buttonHight;

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
    this.buttonHight,
    this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHight,
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
        child: FittedBox(
          child: customWidget ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? AppColors.kBlackColor,
                      fontSize: titleSize ?? AppFonts.fontSize14,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  icon != null ? SizedBox(width: 5.w) : const SizedBox.shrink(),
                  icon != null
                      ? const Icon(Icons.search, color: AppColors.kBlackColor)
                      : const SizedBox.shrink(),
                ],
              ),
        ),
      ),
    );
  }
}
