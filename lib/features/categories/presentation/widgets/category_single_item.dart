import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class CategorySingleItem extends StatelessWidget {
  const CategorySingleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 125.h,
        width: 100.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 75.h,
              width: 75.w,
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kBlackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15.h,
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/book.png',
                    fit: BoxFit.contain,
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SectionRoundedButton(
                    title: 'Accessories',
                    onTap: () {},
                    backgroundColor: AppColors.kWhiteColor,
                    titleColor: AppColors.kBlackColor,
                    borderRadius: 15.0.r,
                    titleSize: 8.sp,
                    buttonWidth: 100.w,
                    buttonHight: 35.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
