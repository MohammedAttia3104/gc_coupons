import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

abstract class AppStyles {
  static TextStyle style14Bold = TextStyle(
    color: AppColors.kWhiteColor,
    fontSize: AppFonts.fontSize14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style12Nor = TextStyle(
    color: AppColors.kBlackColor,
    fontSize: AppFonts.fontSize12,
  );
  static TextStyle style18Bold = TextStyle(
    color: AppColors.kBlackColor,
    fontSize: AppFonts.fontSize18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style20Bold = TextStyle(
    color: AppColors.kBlackColor,
    fontSize: AppFonts.fontSize20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle drawerTabStyle = TextStyle(
    color: AppColors.kBlackColor,
    fontSize: AppFonts.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle noConnectionStyle = TextStyle(
    fontSize: AppFonts.fontSize20,
    color: AppColors.showDealBtnColor,
  );
}
