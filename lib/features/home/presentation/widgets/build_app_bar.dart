import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

AppBar buildAppBar({required VoidCallback onPressed}) {
  return AppBar(
    backgroundColor: AppColors.appBarColor,
    leading: IconButton(
      icon: const Icon(
        Icons.menu_outlined,
        size: 30,
        color: AppColors.kBlackColor,
      ),
      onPressed: onPressed,
    ),
    shadowColor: AppColors.kBlackColor,
    elevation: 5,
    title: Text(
      AppStrings.appName,
      style: TextStyle(
        color: AppColors.appNameColor,
        fontSize: AppFonts.fontSize24,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
