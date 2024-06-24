import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';

class SectionRoundedButton extends StatelessWidget {
  final Widget? icon;
  final String title;
  final Function() onTap;

  const SectionRoundedButton({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(25.r),
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
          children: [
            Text(
              title,
              style: AppStyles.style14Bold.copyWith(
                color: AppColors.kBlackColor,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            icon ??
                const Icon(
                  Icons.search,
                  color: AppColors.kBlackColor,
                ),
          ],
        ),
      ),
    );
  }
}
