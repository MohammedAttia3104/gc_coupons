import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/routers/routes.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.searchScreen);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(0.1),
              blurRadius: 10.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              AppStrings.search,
              style: AppStyles.style14Bold.copyWith(
                color: AppColors.kBlackColor,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.search,
              size: 24.r,
              color: AppColors.kBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}
