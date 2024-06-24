import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';

class BottomNavBarModel {
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? selectedIconColor;
  Color? notSelectedIconColor;

  BottomNavBarModel({
    required this.selectedIconColor,
    required this.title,
    required this.icon,
    required this.backgroundColor,
    this.notSelectedIconColor = AppColors.kBlackColor,
  });
}
