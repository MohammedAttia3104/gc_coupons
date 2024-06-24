import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.home,
              size: AppConstantSizes.kDrawerIconSize,
            ),
            title: Text(
              AppStrings.homeTab,
              style: AppStyles.drawerTabStyle,
            ),
            onTap: () {},
          ),
          Divider(
            color: AppColors.shadowColor,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(
              Icons.search,
              size: AppConstantSizes.kDrawerIconSize,
            ),
            title: Text(
              AppStrings.browseCategoriesTab,
              style: AppStyles.drawerTabStyle,
            ),
            onTap: () {},
          ),
          Divider(
            color: AppColors.shadowColor,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_page_rounded,
              size: AppConstantSizes.kDrawerIconSize,
            ),
            title: Text(
              AppStrings.advertiseWithUsTab,
              style: AppStyles.drawerTabStyle,
            ),
            onTap: () {},
          ),
          Divider(
            color: AppColors.shadowColor,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(
              Icons.phone,
              size: AppConstantSizes.kDrawerIconSize,
            ),
            title: Text(
              AppStrings.contactUsTab,
              style: AppStyles.drawerTabStyle,
            ),
            onTap: () {},
          ),
          Divider(
            color: AppColors.shadowColor,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(
              Icons.lock,
              size: AppConstantSizes.kDrawerIconSize,
            ),
            title: Text(
              AppStrings.privacyPolicyTab,
              style: AppStyles.drawerTabStyle,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
